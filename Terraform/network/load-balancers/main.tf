resource "aws_lb" "nodejs_starter_frontend_lb" {
    name = var.nodejs_starter_frontend_lb.name
    internal = var.nodejs_starter_frontend_lb.internal
    load_balancer_type = var.nodejs_starter_frontend_lb.load_balancer_type
    security_groups = var.nodejs_starter_frontend_lb.security_groups
    subnets = var.nodejs_starter_frontend_lb.subnets
    tags = var.nodejs_starter_frontend_lb.tags
}

output "nodejs_starter_frontend_lb_dns" {
    description = "NodeJS Starter Front-End ECS Load Balancer URL"
    value = aws_lb.nodejs_starter_frontend_lb.dns_name
}

output "frontend_lb_arn" {
    description = "NodeJS Starter Front-End ECS Load Balancer ARN"
    value = aws_lb.nodejs_starter_frontend_lb.arn
}

output "nodejs_starter_frontend_lb_zone_id" {
    description = "nodejs_starter_frontend ECS Load Balancer Zone ID"
    value = aws_lb.nodejs_starter_frontend_lb.zone_id
}