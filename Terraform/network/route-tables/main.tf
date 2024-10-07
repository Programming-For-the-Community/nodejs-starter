resource "aws_route_table" "nodejs_starter_frontend_route_table" {
    vpc_id = var.nodejs_starter_frontend_route_table.vpc_id
    route {
        cidr_block = var.nodejs_starter_frontend_route_table.cidr_block
        gateway_id = var.nodejs_starter_frontend_route_table.gateway_id
    }
    tags = var.nodejs_starter_frontend_route_table.tags
}
  
resource "aws_route_table_association" "nodejs_starter_frontend_association_a" {
    subnet_id = var.nodejs_starter_frontend_route_table.subnet_ids[0]
    route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}

resource "aws_route_table_association" "nodejs_starter_frontend_association_b" {
    subnet_id = var.nodejs_starter_frontend_route_table.subnet_ids[1]
    route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}

resource "aws_route_table_association" "nodejs_starter_frontend_association_c" {
    subnet_id = var.nodejs_starter_frontend_route_table.subnet_ids[2]
    route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}