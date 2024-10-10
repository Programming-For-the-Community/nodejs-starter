resource "aws_internet_gateway" "nodejs_starter_ig" {
    vpc_id = var.vpc_id
    tags = {
        Name = "NodeJS Starter Internet Gateway"
        project = var.resource_tags.project
        owner = var.resource_tags.owner
        environment = var.resource_tags.environment
    }
}