# Route53 Hosted Zone (if creating new domain)
resource "aws_route53_zone" "website" {
  count = var.create_hosted_zone ? 1 : 0
  name  = var.domain_name

  tags = {
    Name        = "Hosted Zone for ${var.domain_name}"
    Environment = var.environment
  }
}

# Data source for existing hosted zone
data "aws_route53_zone" "website" {
  count = var.create_hosted_zone ? 0 : 1
  name  = var.domain_name
}

locals {
  hosted_zone_id = var.create_hosted_zone ? aws_route53_zone.website[0].zone_id : data.aws_route53_zone.website[0].zone_id
}

# Certificate validation records
resource "aws_route53_record" "certificate_validation" {
  for_each = {
    for dvo in aws_acm_certificate.website.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = local.hosted_zone_id
}

# A record for root domain
resource "aws_route53_record" "website" {
  zone_id = local.hosted_zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }
}

# A record for www subdomain
resource "aws_route53_record" "website_www" {
  zone_id = local.hosted_zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }
}
