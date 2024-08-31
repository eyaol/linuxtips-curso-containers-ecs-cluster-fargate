#
# Project Name
# 
variable "project_name" {
  type = string
}

#
# Region
# 
variable "region" {
  type = string
}

#
# SSM VPC ID
# 
variable "ssm_vpc_id" {
  type = string
}

#
# Public subnets
# 
variable "ssm_public_subnet_1" {
  type = string
}

variable "ssm_public_subnet_2" {
  type = string
}

variable "ssm_public_subnet_3" {
  type = string
}

#
# Private subnets
# 
variable "ssm_private_subnet_1" {
  type = string
}

variable "ssm_private_subnet_2" {
  type = string
}

variable "ssm_private_subnet_3" {
  type = string
}

#
# Load balancer
#
variable "load_balancer_internal" {
  type = bool
}

variable "load_balancer_type" {
  type = string
}