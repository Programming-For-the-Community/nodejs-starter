resource "aws_eip" "nodejs_starter_nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nodejs_starter_nat_gateway" {
  allocation_id = aws_eip.nodejs_starter_nat_eip.id
  subnet_id     = aws_subnet.nodejs_starter_public.id
}