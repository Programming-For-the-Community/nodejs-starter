resource "aws_subnet" "nodejs_starter_public1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public1_subnet_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "NodeJS Starter Public1 Subnet"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_subnet" "nodejs_starter_public2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public2_subnet_cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name        = "NodeJS Starter Public2 Subnet"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_subnet" "nodejs_starter_east2a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_a_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name        = "NodeJS Starter Subnet East 2A"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_subnet" "nodejs_starter_east2b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_b_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name        = "NodeJS Starter Subnet East 2B"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_subnet" "nodejs_starter_east2c" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_c_cidr
  availability_zone = "${var.region}c"
  tags = {
    Name        = "NodeJS Starter Subnet East 2C"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}