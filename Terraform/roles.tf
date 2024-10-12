resource "aws_iam_role" "nodejs_starter_frontend_ecs_role" {
  name = "nodejs_starter_frontend_ecs_role"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
  ]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole"
        ]
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

resource "aws_iam_policy" "nodejs_starter_frontend_cloudwatch_policy" {
  name        = "NodeJSStarterFrontendCloudWatchPolicy"
  description = "Policy for ECS role to allow access to CloudWatch Logs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:GetLogEvents"
        ]
        Resource = [
          "arn:aws:logs:${var.region}:${var.account_id}:log-group:/ecs/${var.aws_cloudwatch_log_group.nodejs-starter-frontend-ecs.name}/*",
          "arn:aws:logs:${var.region}:${var.account_id}:log-group:/ecs/${var.aws_cloudwatch_log_group.nodejs-starter-frontend-ecs.name}:*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_cloudwatch_policy" {
  policy_arn = aws_iam_policy.nodejs_starter_frontend_cloudwatch_policy.arn
  role       = aws_iam_role.nodejs_starter_frontend_ecs_role.name
}
