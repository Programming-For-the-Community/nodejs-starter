resource "aws_internet_gateway" "nodejs_starter_ig" {
  vpc_id = var.vpc_id
  tags = {
    Name        = "NodeJS Starter Internet Gateway"
    project     = var.project_name
    owner       = var.owner
    environment = var.environment
  }
}