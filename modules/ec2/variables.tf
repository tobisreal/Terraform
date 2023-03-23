variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "instance_name" {}
variable "security_group_name_prefix" {}
variable "ingress_port" {}
variable "ingress_cidr_block" {}
variable "asg_name" {
  description = "Name of the Auto Scaling Group"
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to launch instances in"
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
}

variable "lc_name" {
  description = "Name of the Launch Configuration to use for instances"
}