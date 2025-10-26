variable "domain_name" {
  description = "The domain name for the website"
  type        = string
  default     = "example.com"
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-central-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "create_hosted_zone" {
  description = "Whether to create a new Route53 hosted zone"
  type        = bool
  default     = false
}
