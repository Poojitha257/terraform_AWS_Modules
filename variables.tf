//aws region 
variable "aws_region" {
  description = "define the region"
  type = string
  //default="us-east-1"
}
// VPC cidr
variable "vpc_cidr" {
description = "define VPC CIDR range"
type = string
//default = "10.0.0.0/16"
}
//cidr for public subnet
variable "pub_subnet_cidr" {
  type = string
// default = "10.0.1.0/24"
}
// cidr for private subnet
variable "pvt_subnet_cidr" {
  type = string
  //default = "10.0.5.0/24"
}
//Availability zone
variable "az" {
  description ="availability zone"
  type = string
  //default = "us-east-1a"
}
//tags
variable "name_tag" {
  type = string
  default = "project name for tagging"
}




/*
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "application_server" 
}
variable "ami_id" {
  type= string
  default = "ami-05c179eced2eb9b5b"
}
variable "inst_type"{
    type = string
    default = "t2.medium"
}
*/


