
data "aws_route53_zone" "hosted_zone" {
  name = "justgetitalready.com" # Replace with your existing domain name
}

resource "aws_route53_record" "domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "www" # Replace with your desired record name
  type    = "A"


  alias {
    name                   = aws_lb.application_load_balancer.dns_name
    zone_id                = aws_lb.application_load_balancer.zone_id
    evaluate_target_health = true
  }
}