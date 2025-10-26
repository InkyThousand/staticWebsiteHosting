# WAF Web ACL for CloudFront (must be in us-east-1)
resource "aws_wafv2_web_acl" "website" {
  provider = aws.us_east_1
  name     = "${replace(var.domain_name, ".", "-")}-waf"
  scope    = "CLOUDFRONT"

  default_action {
    allow {}
  }

  # AWS Core Rule Set
  rule {
    name     = "AWSManagedRulesCore"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                 = "AWSManagedRulesCore"
      sampled_requests_enabled    = true
    }
  }

  # AWS Known Bad Inputs Rule Set
  rule {
    name     = "AWSManagedRulesKnownBadInputs"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                 = "AWSManagedRulesKnownBadInputs"
      sampled_requests_enabled    = true
    }
  }

  # AWS IP Reputation Rule Set
  rule {
    name     = "AWSManagedRulesIPReputation"
    priority = 3

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                 = "AWSManagedRulesIPReputation"
      sampled_requests_enabled    = true
    }
  }

  tags = {
    Name        = "WAF for ${var.domain_name}"
    Environment = var.environment
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                 = "StaticWebsiteWAF"
    sampled_requests_enabled    = true
  }
}
