terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

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

provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name = "iac-lab-placeholder:dsuren"
  }
}
