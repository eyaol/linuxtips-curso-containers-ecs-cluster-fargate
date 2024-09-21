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

#
# Ecs general
#
variable "nodes_ami" {
  type = string
}

variable "node_instance_type" {
  type = string
}

variable "node_volume_size" {
  type = string
}

variable "node_volume_type" {
  type = string
}

variable "cluster_on_demand_min_size" {
  type = number
}

variable "cluster_on_demand_max_size" {
  type = number
}

variable "cluster_on_demand_desired_size" {
  type = number
}

variable "cluster_spot_min_size" {
  type = number
}

variable "cluster_spot_max_size" {
  type = number
}

variable "cluster_spot_desired_size" {
  type = number
}

variable "instance_profile_name" {
  type    = string
  default = "ecsInstanceProfile"
}

variable "capacity_providers" {
  type = list
  default = [
    "FARGATE", "FARGATE_SPOT"
  ]
}