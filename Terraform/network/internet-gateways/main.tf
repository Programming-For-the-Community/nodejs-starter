resource "aws_internet_gateway" "nodejs_starter_ig" {
    vpc_id = var.nodejs_starter_ig.vpc_id
    tags = var.nodejs_starter_ig.tags
}

output "nodejs_starter_ig_id" {
    description = "NodeJS Starter Internet Gateway ID"
    value = aws_internet_gateway.nodejs_starter_ig.id
}