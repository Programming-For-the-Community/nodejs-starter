resource "aws_lb" "nodejs_starter_frontend_lb" {
  name                             = "nodejs-starter-frontend-ecs-lb"
  internal                         = false
  load_balancer_type               = "application"
  enable_cross_zone_load_balancing = true

  security_groups = [
    aws_security_group.nodejs_starter_frontend_elb_sg.id
  ]

  subnets = [
    aws_subnet.nodejs_starter_public1.id,
    aws_subnet.nodejs_starter_public2.id
  ]

  lifecycle {
    create_before_destroy = true # Create new resource before destroying old one
  }

  access_logs {
    bucket  = aws_s3_bucket.nodejs_starter_frontend_lb_logs.id
    enabled = true
    prefix  = "nodejs-starter-frontend-ecs-lb-logs/"
  }

  tags = {
    Name        = "NodeJS Starter Front-End ECS Load Balancer"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_lb_target_group" "lambda_get_team_tg" {
  name        = "lambda-get-team-tg"
  target_type = "lambda"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/health"
    enabled             = true
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "Target groupt for the Lambda function get-team"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_lb_target_group" "nodejs_starter_frontend_lb_tg" {
  name        = "node-starter-frontend-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/health"
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 10
    interval            = 30
    matcher             = "200"
    timeout             = 10
  }

  tags = {
    Name        = "NodeJS Starter Front-End ECS Load Balancer Target Group HTTP"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_lb_listener" "nodejs_starter_frontend_lb_listener" {
  load_balancer_arn = aws_lb.nodejs_starter_frontend_lb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.nodejs-starter-frontend-certificate.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nodejs_starter_frontend_lb_tg.arn
  }

  tags = {
    Name        = "NodeJS Starter Front-End ECS Load Balancer Listener HTTPS"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_lb_listener_rule" "get_team_rule" {
  listener_arn = aws_lb_listener.nodejs_starter_frontend_lb_listener.arn
  priority     = 1

  condition {
    path_pattern {
      values = ["/api/get-team*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lambda_get_team_tg.arn
  }

  tags = {
    Name        = "NodeJS Starter Listener Rule for Get Team Lambda Function"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_lb_listener" "nodejs_starter_http_redirect_listener" {
  load_balancer_arn = aws_lb.nodejs_starter_frontend_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }
}
