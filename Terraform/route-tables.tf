resource "aws_route_table" "nodejs_starter_frontend_route_table" {
    vpc_id = var.vpc_id

    route {
        gateway_id = aws_internet_gateway.nodejs_starter_ig.id
        cidr_block = var.all_traffic
    }

    tags = {
        Name = "NodeJS Starter Front-End Route Table"
        project = var.resource_tags.project
        owner = var.resource_tags.owner
        environment = var.resource_tags.environment
    }
}
  
resource "aws_route_table_association" "nodejs_starter_frontend_association_a" {
    subnet_id = aws_subnet.nodejs_starter_east2a.id
    route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}

resource "aws_route_table_association" "nodejs_starter_frontend_association_b" {
    subnet_id = aws_subnet.nodejs_starter_east2b.id
    route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}

resource "aws_route_table_association" "nodejs_starter_frontend_association_c" {
    subnet_id = aws_subnet.nodejs_starter_east2c.id
    route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}