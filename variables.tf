
variable "region" {
  type        = string
  description = "Region to deploy iac solution"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "prefix" {
  type        = string
  description = "vpc-tag"
}

variable "prefix-lb" {
  type        = string
  description = "load balancer prefix"
}

variable "prefix-tg" {
  type        = string
  description = "target group prefix"
}

variable "subnet_cidr" {
  type        = string
  description = "public subnet cidr"
}
