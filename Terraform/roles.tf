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
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
      },
    ],
  })
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
          "arn:aws:logs:${var.region}:${var.account_id}:log-group:/ecs/${aws_cloudwatch_log_group.nodejs-starter-frontend-ecs.name}/*",
          "arn:aws:logs:${var.region}:${var.account_id}:log-group:/ecs/${aws_cloudwatch_log_group.nodejs-starter-frontend-ecs.name}:*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "ecr_access_policy" {
  name        = "NodeJSECRAccessPolicy"
  description = "Policy for ECS task to allow access to ECR"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_vpc_policy" {
  name        = "LambdaVpcPolicy"
  description = "Allows Lambda function to access VPC resources"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs",
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "ec2:AssignPrivateIpAddresses",
          "ec2:UnassignPrivateIpAddresses"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_ecr_access_policy" {
  policy_arn = aws_iam_policy.ecr_access_policy.arn
  role       = aws_iam_role.nodejs_starter_frontend_ecs_role.name
}

resource "aws_iam_role_policy_attachment" "attach_cloudwatch_policy" {
  policy_arn = aws_iam_policy.nodejs_starter_frontend_cloudwatch_policy.arn
  role       = aws_iam_role.nodejs_starter_frontend_ecs_role.name
}

resource "aws_iam_policy_attachment" "lambda_policy" {
  name       = "lambda-policy-attachment"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_vpc_policy.arn
  role       = aws_iam_role.lambda_role.name
}

