resource "aws_iam_role" "nodejs_starter_frontend_ecs_role" {
  name                = "nodejs_starter_frontend_ecs_role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/PowerUserAccess", "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
  tags = {
    Name        = "NodeJS Starter Front-EndECS Role"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}