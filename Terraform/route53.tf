resource "aws_route53_zone" "professorchaos0802_zone" {
  name = "professorchaos0802.com"
}

resource "aws_route53_record" "professorchaos0802_record" {
  zone_id = aws_route53_zone.professorchaos0802_zone.zone_id
  name    = "professorchaos0802.com"
  type    = "A"
  alias {
    name                   = aws_lb.nodejs_starter_frontend_lb.dns_name
    zone_id                = aws_lb.nodejs_starter_frontend_lb.zone_id
    evaluate_target_health = true
  }
}