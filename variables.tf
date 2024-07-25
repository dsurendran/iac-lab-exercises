
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

variable "public_subnet_cidr" {
  type        = string
  description = "public subnet cidr"
}

variable "subnet2_cidr" {
  type        = string
  description = "subnet2_cidr"
}

variable "subnet3_cidr" {
  type        = string
  description = "subnet3_cidr"
}

variable "subnet4_cidr" {
  type        = string
  description = "subnet4_cidr"
}

variable "subnet5_cidr" {
  type        = string
  description = "subnet5_cidr"
}

variable "subnet6_cidr" {
  type        = string
  description = "subnet6_cidr"
}
