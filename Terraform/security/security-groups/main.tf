resource "aws_security_group" "nodejs_starter_frontend_ecs_sg" {
    name_prefix = var.nodejs_starter_frontend_ecs_sg.name_prefix
    vpc_id = var.nodejs_starter_frontend_ecs_sg.vpc_id
    ingress {
        from_port = var.nodejs_starter_frontend_ecs_sg.ingress.from_port
        to_port = var.nodejs_starter_frontend_ecs_sg.ingress.to_port
        protocol = var.nodejs_starter_frontend_ecs_sg.ingress.protocol
        cidr_blocks = var.nodejs_starter_frontend_ecs_sg.ingress.cidr_blocks
    }
    egress {
        from_port = var.nodejs_starter_frontend_ecs_sg.egress.from_port
        to_port = var.nodejs_starter_frontend_ecs_sg.egress.to_port
        protocol = var.nodejs_starter_frontend_ecs_sg.egress.protocol
        cidr_blocks = var.nodejs_starter_frontend_ecs_sg.egress.cidr_blocks
    }
    tags = var.nodejs_starter_frontend_ecs_sg.tags
}

resource "aws_security_group" "nodejs_starter_frontend_elb_sg" {
    name_prefix = var.nodejs_starter_frontend_elb_sg.name_prefix
    vpc_id = var.nodejs_starter_frontend_elb_sg.vpc_id
    ingress {
        from_port = var.nodejs_starter_frontend_elb_sg.ingress.from_port
        to_port = var.nodejs_starter_frontend_elb_sg.ingress.to_port
        protocol = var.nodejs_starter_frontend_elb_sg.ingress.protocol
        cidr_blocks = var.nodejs_starter_frontend_elb_sg.ingress.cidr_blocks
    }
    egress {
        from_port = var.nodejs_starter_frontend_elb_sg.egress.from_port
        to_port = var.nodejs_starter_frontend_elb_sg.egress.to_port
        protocol = var.nodejs_starter_frontend_elb_sg.egress.protocol
        cidr_blocks = var.nodejs_starter_frontend_elb_sg.egress.cidr_blocks
    }
    tags = var.nodejs_starter_frontend_elb_sg.tags
}

output "nodejs_starter_frontend_ecs_sg_id" {
    description = "NodeJS Starter Front-End Security Group ID"
    value = aws_security_group.nodejs_starter_frontend_ecs_sg.id
}

output "nodejs_starter_frontend_elb_sg_id" {
    description = "NodeJS Starter Front-End ELB Security Group ID"
    value = aws_security_group.nodejs_starter_frontend_elb_sg.id
}