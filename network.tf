module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = format("%s-vpc", var.prefix)
  cidr   = var.vpc_cidr

  azs = ["ap-south-1a", "ap-south-1b"]
  private_subnets = [cidrsubnet(var.subnet_cidr, 4, 2),
    cidrsubnet(var.subnet_cidr, 4, 3),
    cidrsubnet(var.subnet_cidr, 4, 4),
  cidrsubnet(var.subnet_cidr, 4, 5)]

  public_subnets = [cidrsubnet(var.subnet_cidr, 4, 0),
  cidrsubnet(var.subnet_cidr, 4, 1)]
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = true
  enable_ipv6            = false
}
