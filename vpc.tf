resource "aws_vpc" "default" {
  cidr_block           = local.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "VPC"
    Environment = var.env
    Project     = var.project
  }
}

resource "aws_subnet" "default-public" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = local.vpc_cidr_publicA
  availability_zone = format("%sa", local.aws_region)
  tags = {
    Name        = "Public Subnet"
    Environment = var.env
    Project     = var.project
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name        = "Internal Gateways"
    Environment = var.env
    Project     = var.project
  }
}