resource "aws_s3_bucket" "nodejs_starter_frontend_lb_logs" {
  bucket = "nodejs-starter-frontend-lb-logs-048908104884"

  tags = {
    Name        = "NodeJS Starter Front-End ECS Load Balancer Logs"
    project     = var.project
    environment = var.environment
    owner       = var.owner
  }
}