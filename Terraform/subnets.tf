resource "aws_subnet" "nodejs_starter_east2a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_a_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name        = "NodeJS Starter Subnet East 2A"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}

resource "aws_subnet" "nodejs_starter_east2b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_b_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name        = "NodeJS Starter Subnet East 2B"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}

resource "aws_subnet" "nodejs_starter_east2c" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_c_cidr
  availability_zone = "${var.region}c"
  tags = {
    Name        = "NodeJS Starter Subnet East 2C"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}