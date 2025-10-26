# Static Website Hosting on AWS with Terraform
# Complete infrastructure for secure, scalable static website hosting

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS Provider
provider "aws" {
  region = var.aws_region
}

# Provider for ACM certificates (must be in us-east-1 for CloudFront)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# Data source for current AWS account
data "aws_caller_identity" "current" {}

# Random suffix for unique resource names
resource "random_string" "bucket_suffix" {
  length  = 4
  special = false
  upper   = false
}
