resource "aws_subnet" "nodejs_starter_dev_east2a" {
    vpc_id = var.nodejs_starter_dev_east2a.vpc_id
    cidr_block = var.nodejs_starter_dev_east2a.cidr_block
    availability_zone = var.nodejs_starter_dev_east2a.availability_zone
    tags = var.nodejs_starter_dev_east2a.tags
}

resource "aws_subnet" "nodejs_starter_dev_east2b" {
    vpc_id = var.nodejs_starter_dev_east2b.vpc_id
    cidr_block = var.nodejs_starter_dev_east2b.cidr_block
    availability_zone = var.nodejs_starter_dev_east2b.availability_zone
    tags = var.nodejs_starter_dev_east2b.tags
}

resource "aws_subnet" "nodejs_starter_dev_east2c" {
    vpc_id = var.nodejs_starter_dev_east2c.vpc_id
    cidr_block = var.nodejs_starter_dev_east2c.cidr_block
    availability_zone = var.nodejs_starter_dev_east2c.availability_zone
    tags = var.nodejs_starter_dev_east2c.tags
}