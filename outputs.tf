// VPC 
output "vpc_id" {
  description = "ID of VPC"
  value = aws_vpc.vpc.id
}
// public subnet
output "publicsubnet_id" {
  description = "ID of subnet"
  value = aws_subnet.publicsubnet.id
}
//private subnet
output "privatesubnet_id" {
  description = "ID of private subnet"
  value = aws_subnet.privatesubnet.id
}

//IGW
output "igw_id" {
  description = "IGW ID"
  value = aws_internet_gateway.igw.id
}

//nat gateway
output "nat_id" {
description = "NAT ID"
value = aws_nat_gateway.nat.id
} 
//eip
output "nat" {
  description = "eip associated with nat"
  value = aws_eip.nat_eip.id
}

// private route table
output "private_rt_id" {
  description = "private route table ID"
  value = aws_route_table.pvt_rt.id
}

// public route table
output "public_rt_id" {
  description = "public route table ID"
  value = aws_route_table.pub_rt.id
}