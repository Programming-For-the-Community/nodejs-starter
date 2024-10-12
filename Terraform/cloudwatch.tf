resource "aws_cloudwatch_log_group" "nodejs-starter-frontend-ecs" {
  name              = "nodejs-starter-frontend-ecs"
  retention_in_days = 2
  tags = {
    Name        = "NodeJS Starter Front-End Log Group"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}