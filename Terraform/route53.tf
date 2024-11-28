resource "aws_route53_record" "professorchaos0802_record" {
  zone_id = var.hosted_zone_id
  name    = "nodejs-starter"
  type    = "A"
  alias {
    name                   = aws_lb.nodejs_starter_frontend_lb.dns_name
    zone_id                = aws_lb.nodejs_starter_frontend_lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "professorchaos0802_certificate_record" {
  zone_id = var.hosted_zone_id
  name    = aws_acm_certificate.nodejs-starter-frontend-certificate.domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.nodejs-starter-frontend-certificate.domain_validation_options[0].resource_record_type
  ttl     = 60
  records = [aws_acm_certificate.nodejs-starter-frontend-certificate.domain_validation_options[0].resource_record_value]
}