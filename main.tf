resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = var.vpc_name
    },
    var.tags
  )
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "${var.region}a" # Make AZ configurable
  map_public_ip_on_launch = false            # Explicitly set for clarity

  tags = merge(
    {
      Name = var.subnet_name
    },
    var.tags
  )
}

resource "aws_subnet" "example" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "${var.region}a"
  cidr_block       = var.default_vpc_subnet_cidr # Fixed variable name typo

  tags = merge(
    {
      Name = "example-subnet"
    },
    var.tags
  )
}