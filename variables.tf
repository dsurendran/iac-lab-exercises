
variable "region" {
  type        = string
  description = "Region to deploy iac solution"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "192.168.1.0/25"
}

variable "prefix" {
  type        = string
  description = "vpc-tag"
}

variable "subnet_cidr" {
  type        = string
  description = "public subnet cidr"
}
