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
  name    = element(aws_acm_certificate.nodejs-starter-frontend-certificate.domain_validation_options[*].resource_record_name, 0)
  type    = element(aws_acm_certificate.nodejs-starter-frontend-certificate.domain_validation_options[*].resource_record_type, 0)
  ttl     = 60
  records = [element(aws_acm_certificate.nodejs-starter-frontend-certificate.domain_validation_options[*].resource_record_value, 0)]
}