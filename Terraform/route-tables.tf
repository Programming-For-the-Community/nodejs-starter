resource "aws_route_table" "nodejs_starter_public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.all_traffic
    gateway_id = aws_internet_gateway.nodejs_starter_ig.id
  }

  tags = {
    Name        = "NodeJS Starter Public Route Table"
    project     = var.project_name
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_route_table" "nodejs_starter_frontend_route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "NodeJS Starter Front-End Route Table"
    project     = var.project_name
    owner       = var.owner
    environment = var.environment
  }

  depends_on = [aws_nat_gateway.nodejs_starter_nat_gateway]
}

resource "aws_route" "nodejs_starter_frontend_private_route" {
  route_table_id         = aws_route_table.nodejs_starter_frontend_route_table.id
  destination_cidr_block = var.all_traffic
  nat_gateway_id         = aws_nat_gateway.nodejs_starter_nat_gateway.id

  depends_on = [aws_nat_gateway.nodejs_starter_nat_gateway]
}

resource "aws_route_table_association" "nodejs_starter_public_association" {
  subnet_id      = aws_subnet.nodejs_starter_public.id
  route_table_id = aws_route_table.nodejs_starter_public_route_table.id
}

resource "aws_route_table_association" "nodejs_starter_frontend_association_a" {
  subnet_id      = aws_subnet.nodejs_starter_east2a.id
  route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}

resource "aws_route_table_association" "nodejs_starter_frontend_association_b" {
  subnet_id      = aws_subnet.nodejs_starter_east2b.id
  route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}

resource "aws_route_table_association" "nodejs_starter_frontend_association_c" {
  subnet_id      = aws_subnet.nodejs_starter_east2c.id
  route_table_id = aws_route_table.nodejs_starter_frontend_route_table.id
}