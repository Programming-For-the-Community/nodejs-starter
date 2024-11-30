resource "aws_s3_bucket" "nodejs_starter_frontend_lb_logs" {
  bucket = "nodejs-starter-frontend-lb-logs-048908104884"

  tags = {
    Name        = "NodeJS Starter Front-End ECS Load Balancer Logs"
    project     = var.project
    environment = var.environment
    owner       = var.owner
  }
}

resource "aws_s3_bucket_public_access_block" "nodejs_starter_frontend_lb_logs_access" {
  bucket = aws_s3_bucket.nodejs_starter_frontend_lb_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "nodejs_starter_frontend_lb_logs_policy" {
  bucket = aws_s3_bucket.nodejs_starter_frontend_lb_logs.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowLBLogDelivery"
        Effect = "Allow"
        Principal = {
          Service = "delivery.logs.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "arn:aws:s3:::${aws_s3_bucket.nodejs_starter_frontend_lb_logs.bucket}/*"
        Condition = {
          StringEquals = {
            "aws:SourceAccount" = var.account_id # Replace with your AWS Account ID
          }
        }
      }
    ]
  })
}