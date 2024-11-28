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
  for_each = { for option in aws_acm_certificate.nodejs-starter-frontend-certificate.domain_validation_options : option.resource_record_name => option }

  zone_id = var.hosted_zone_id
  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  ttl     = 60
  records = [each.value.resource_record_value]
}