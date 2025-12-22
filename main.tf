terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create a VPC
resource "aws_vpc" "vpc"{
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.name_tag}-vpc"
  }
}

# create a IGW
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name="${var.name_tag}-igw"
    }
}

# create a public subnet 
resource "aws_subnet" "publicsubnet" { 
vpc_id = aws_vpc.vpc.id
cidr_block = var.pub_subnet_cidr
availability_zone = var.az
tags = {
  Name = "${var.name_tag}-publicsubnet"
}
}

# create a private subnet
 resource "aws_subnet" "privatesubnet" {
   vpc_id = aws_vpc.vpc.id
   cidr_block = var.pvt_subnet_cidr
   availability_zone = var.az
   tags ={
     Name = "${var.name_tag}-privatesubnet"
   }
 }

# create a public route table
resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "${var.name_tag}-pub_rt"
    }
}   

# associate public route table with public subnet
resource "aws_route_table_association" "pubrt_association" {
  subnet_id = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.pub_rt.id
}

#EIP for NAT gateway
resource "aws_eip" "nat_eip" {
  domain   = "vpc"
tags = {
    Name = "${var.name_tag}-nat_eip"
  }
}

#NAT gateway(public subnet)
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.allocation_id
  subnet_id = aws_subnet.publicsubnet.id
  tags = {
    Name = "${var.name_tag}-nat"
  }
depends_on = [aws_internet_gateway.igw]
}

# create a private route table
resource "aws_route_table" "pvt_rt" {
   vpc_id = aws_vpc.vpc.id
   route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
   }
   tags = {
    Name = "${var.name_tag}-pvtroutetable"
   }
}

#associate private route table with private subnet
resource "aws_route_table_association" "pvtrtasso" {
  subnet_id = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.pvt_rt.id
}
