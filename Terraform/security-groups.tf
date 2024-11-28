resource "aws_security_group" "nodejs_starter_frontend_ecs_sg" {
  name_prefix = "nodejs_starter_frontend_ecs_sg"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "NodeJS Starter Front-End ECS Security Group"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_security_group_rule" "nodejs_starter_frontend_ecs_sg_egress" {
  type              = "egress"
  security_group_id = aws_security_group.nodejs_starter_frontend_ecs_sg.id
  cidr_blocks       = [var.all_traffic]
  description       = "NodeJS Starter Front-End ECS Security Group Egress Rule"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}

resource "aws_security_group_rule" "nodejs_starter_frontend_ecs_sg_ingress_http" {
  type              = "ingress"
  security_group_id = aws_security_group.nodejs_starter_frontend_ecs_sg.id
  cidr_blocks       = [var.vpc_cidr]
  description       = "NodeJS Starter Front-End ECS Security Group Ingress Rule"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
}

resource "aws_security_group_rule" "nodejs_starter_frontend_ecs_sg_ingress_https" {
  type              = "ingress"
  security_group_id = aws_security_group.nodejs_starter_frontend_ecs_sg.id
  cidr_blocks       = [var.vpc_cidr]
  description       = "NodeJS Starter Front-End ECS Security Group Ingress Rule"
  from_port         = 8443
  to_port           = 8443
  protocol          = "tcp"
}

resource "aws_security_group" "nodejs_starter_frontend_elb_sg" {
  name_prefix = "nodejs_starter_frontend_elb_sg"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "NodeJS Starter Front-End ELB Security Group"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_security_group_rule" "nodejs_starter_frontend_elb_sg_egress" {
  type              = "egress"
  security_group_id = aws_security_group.nodejs_starter_frontend_elb_sg.id
  cidr_blocks       = [var.all_traffic]
  description       = "NodeJS Starter Front-End ELB Security Group Egress Rule"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}

resource "aws_security_group_rule" "nodejs_starter_frontend_elb_sg_ingress_http" {
  type              = "ingress"
  security_group_id = aws_security_group.nodejs_starter_frontend_elb_sg.id
  cidr_blocks       = [var.all_traffic]
  description       = "NodeJS Starter Front-End ELB Security Group Ingress Rule"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}

resource "aws_security_group_rule" "nodejs_starter_frontend_elb_sg_ingress_https" {
  type              = "ingress"
  security_group_id = aws_security_group.nodejs_starter_frontend_elb_sg.id
  cidr_blocks       = [var.all_traffic]
  description       = "NodeJS Starter Front-End ELB Security Group Ingress Rule"
  from_port         = 8443
  to_port           = 8443
  protocol          = "tcp"
}