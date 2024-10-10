resource "aws_lb" "nodejs_starter_frontend_lb" {
  name               = "nodejs-starter-frontend-ecs-lb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.nodejs_starter_frontend_elb_sg.id
  ]

  subnets = [
    aws_subnet.nodejs_starter_east2a.id,
    aws_subnet.nodejs_starter_east2b.id,
    aws_subnet.nodejs_starter_east2c.id
  ]

  tags = {
    Name        = "NodeJS Starter Front-End ECS Load Balancer"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}

resource "aws_lb_target_group" "nodejs_starter_frontend_lb_tg" {
  name        = "node-starter-frontend-ecs-lb-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 10
    interval            = 30
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = 10
  }

  tags = {
    Name        = "NodeJS Starter Front-End ECS Load Balancer Target Group"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}

# resource "aws_lb_target_group_attachment" "nodejs_starter_frontend_lb_tg_attachment" {
#   target_group_arn = aws_lb_target_group.nodejs_starter_frontend_lb_tg.arn
#   target_id        = aws_ecs_service.nodejs_starter_frontend_service.id
#   port             = 8080
# }

resource "aws_lb_listener" "nodejs_starter_frontend_lb_listener" {
  load_balancer_arn = aws_lb.nodejs_starter_frontend_lb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nodejs_starter_frontend_lb_tg.arn
  }

  tags = {
    Name        = "nodeJS Starter Front-End ECS Load Balancer Listener"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}