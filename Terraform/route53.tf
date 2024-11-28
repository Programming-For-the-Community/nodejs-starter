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