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
  subnet_id     = aws_subnet.public_subnet[1].id
}

resource "aws_subnet" "public_subnet" {
  count             = 2
  vpc_id            = aws_vpc.vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(var.subnet_cidr, 4, count.index)
  tags = {
    Name = format("%s-public-subnet-%s", var.prefix, count.index + 1)
  }
}

resource "aws_subnet" "private_subnet" {
  count             = 2
  vpc_id            = aws_vpc.vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(var.subnet_cidr, 4, count.index + 2)
  tags = {
    Name = format("%s-private-subnet-%s", var.prefix, count.index + 3)
  }
}

resource "aws_subnet" "secure_subnet" {
  count             = 2
  vpc_id            = aws_vpc.vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(var.subnet_cidr, 4, count.index + 4)
  tags = {
    Name = format("%s-secure-subnet-%s", var.prefix, count.index + 5)
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

resource "aws_route_table_association" "rt_public_subnet" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet[1].id
}

resource "aws_route_table_association" "rt_private_subnet1" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet[0].id
}

resource "aws_route_table_association" "rt_private_subnet2" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet[1].id
}
