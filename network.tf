resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet2.id
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet1_cidr
  availability_zone = "ap-south-1a"
  tags = {
    Name = format("%s-public-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet2_cidr
  availability_zone = "ap-south-1b"
  tags = {
    Name = format("%s-public-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet3_cidr
  availability_zone = "ap-south-1a"
  tags = {
    Name = format("%s-private-subnet-3", var.prefix)
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet4_cidr
  availability_zone = "ap-south-1b"
  tags = {
    Name = format("%s-private-subnet-4", var.prefix)
  }
}

resource "aws_subnet" "secure_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet5_cidr
  availability_zone = "ap-south-1a"
  tags = {
    Name = format("%s-secure-subnet-5", var.prefix)
  }
}
resource "aws_subnet" "secure_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet6_cidr
  availability_zone = "ap-south-1b"
  tags = {
    Name = format("%s-secure-subnet-6", var.prefix)
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_eip" "elastic_ip" {
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "rt_public_subnet1" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet1.id
}

resource "aws_route_table_association" "rt_public_subnet2" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet2.id
}

resource "aws_route_table_association" "rt_private_subnet1" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet1.id
}

resource "aws_route_table_association" "rt_private_subnet2" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet2.id
}


resource "aws_subnet" "secure_subnet_4" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.168.1.96/28"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "dsuren-subnet-from-console"
  }
}
