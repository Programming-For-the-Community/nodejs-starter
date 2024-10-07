resource "aws_lb" "nodejs_starter_frontend_lb" {
    name = var.nodejs_starter_frontend_lb.name
    internal = var.nodejs_starter_frontend_lb.internal
    load_balancer_type = var.nodejs_starter_frontend_lb.load_balancer_type
    security_groups = var.nodejs_starter_frontend_lb.security_groups
    subnets = var.nodejs_starter_frontend_lb.subnets
    tags = var.nodejs_starter_frontend_lb.tags
}

resource "aws_lb_target_group" "nodejs_starter_frontend_lb_tg" {
    name = var.nodejs_starter_frontend_lb_tg.name
    port = var.nodejs_starter_frontend_lb_tg.port
    protocol = var.nodejs_starter_frontend_lb_tg.protocol
    target_type = var.nodejs_starter_frontend_lb_tg.target_type
    vpc_id = var.nodejs_starter_frontend_lb_tg.vpc_id

    health_check {
        enabled = var.nodejs_starter_frontend_lb_tg.health_check.enabled
        healthy_threshold = var.nodejs_starter_frontend_lb_tg.health_check.healthy_threshold
        unhealthy_threshold = var.nodejs_starter_frontend_lb_tg.health_check.unhealthy_threshold
        interval = var.nodejs_starter_frontend_lb_tg.health_check.interval
        protocol = var.nodejs_starter_frontend_lb_tg.health_check.protocol
        matcher = var.nodejs_starter_frontend_lb_tg.health_check.matcher
        timeout = var.nodejs_starter_frontend_lb_tg.health_check.timeout
    }

    tags = var.nodejs_starter_frontend_lb_tg.tags
}

resource "aws_lb_listener" "nodejs_starter_frontend_lb_listener" {
    load_balancer_arn = aws_lb.nodejs_starter_frontend_lb.arn
    port = var.nodejs_starter_frontend_lb_listener.port
    protocol = var.nodejs_starter_frontend_lb_listener.protocol
    default_action {
        type = var.nodejs_starter_frontend_lb_listener.default_action_type
        target_group_arn = aws_lb_target_group.nodejs_starter_frontend_lb_tg.arn
    }
    tags = var.nodejs_starter_frontend_lb_listener.tags
}

output "nodejs_starter_frontend_tg_id" {
    description = "NodeJS Starter Front-End ECS Target Group ID"
    value = aws_lb_target_group.nodejs_starter_frontend_lb_tg.id
}

output "nodejs_starter_frontend_lb_listener" {
    description = "NodeJS Starter Front-End ECS Load Balancer Listener"
    value = aws_lb_listener.nodejs_starter_frontend_lb_listener
}

output "nodejs_starter_frontend_lb_dns" {
    description = "NodeJS Starter Front-End ECS Load Balancer URL"
    value = aws_lb.nodejs_starter_frontend_lb.dns_name
}

output "nodejs_starter_frontend_lb_zone_id" {
    description = "nodejs_starter_frontend ECS Load Balancer Zone ID"
    value = aws_lb.nodejs_starter_frontend_lb.zone_id
}