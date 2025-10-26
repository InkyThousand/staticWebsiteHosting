output "website_url" {
  description = "Website URL"
  value       = "https://${var.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.website.id
}

output "cloudfront_domain_name" {
  description = "CloudFront Distribution Domain Name"
  value       = aws_cloudfront_distribution.website.domain_name
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.website.bucket
}

output "s3_bucket_arn" {
  description = "S3 Bucket ARN"
  value       = aws_s3_bucket.website.arn
}

output "certificate_arn" {
  description = "ACM Certificate ARN"
  value       = aws_acm_certificate.website.arn
}

output "hosted_zone_id" {
  description = "Route53 Hosted Zone ID"
  value       = local.hosted_zone_id
}

output "waf_web_acl_arn" {
  description = "WAF Web ACL ARN"
  value       = aws_wafv2_web_acl.website.arn
}
