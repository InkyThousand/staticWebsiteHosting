# SSL Certificate (must be in us-east-1 for CloudFront)
resource "aws_acm_certificate" "website" {
  provider          = aws.us_east_1
  domain_name       = var.domain_name
  subject_alternative_names = ["www.${var.domain_name}"]
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "SSL Certificate for ${var.domain_name}"
    Environment = var.environment
  }
}

# Certificate validation
resource "aws_acm_certificate_validation" "website" {
  provider        = aws.us_east_1
  certificate_arn = aws_acm_certificate.website.arn
  validation_record_fqdns = [for record in aws_route53_record.certificate_validation : record.fqdn]

  timeouts {
    create = "5m"
  }
}
