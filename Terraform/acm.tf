resource "aws_acm_certificate" "nodejs-starter-frontend-certificate" {
  domain_name       = "*.professorchaos0802.com"
  validation_method = "DNS"

  tags = {
    Name        = "professorchaos0802.com SSL Certificate"
    project     = var.project
    environment = var.environment
  }
}