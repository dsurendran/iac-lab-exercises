resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet1_cidr
  availability_zone = "ap-south-1a"
  tags = {
    "name" = format("%s-public-subnet-1", var.prefix)
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet2_cidr
  availability_zone = "ap-south-1b"
  tags = {
    "name" = format("%s-public-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "public_subnet3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet3_cidr
  availability_zone = "ap-south-1b"
  tags = {
    "name" = format("%s-public-subnet-3", var.prefix)
  }
}

resource "aws_subnet" "public_subnet4" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet4_cidr
  availability_zone = "ap-south-1b"
  tags = {
    "name" = format("%s-public-subnet-4", var.prefix)
  }
}

resource "aws_subnet" "public_subnet5" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet5_cidr
  availability_zone = "ap-south-1b"
  tags = {
    "name" = format("%s-public-subnet-5", var.prefix)
  }
}
resource "aws_subnet" "public_subnet6" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet6_cidr
  availability_zone = "ap-south-1b"
  tags = {
    "name" = format("%s-public-subnet-6", var.prefix)
  }
}
