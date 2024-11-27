resource "aws_cloudwatch_log_group" "nodejs-starter-frontend-ecs" {
  name              = "nodejs-starter-frontend-ecs"
  retention_in_days = 3
  tags = {
    Name        = "NodeJS Starter Front-End Log Group"
    project     = var.project_name
    owner       = var.owner
    environment = var.environment
  }
}