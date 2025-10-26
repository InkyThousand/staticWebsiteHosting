# AWS Static Website Hosting with Terraform

A complete Terraform project for deploying secure, scalable static websites on AWS with CloudFront CDN, SSL certificates, and WAF protection.

## Architecture

This project creates:
- **S3 Bucket** - Private bucket for static content storage
- **CloudFront Distribution** - Global CDN with custom domain and SSL
- **Origin Access Control (OAC)** - Secure S3 access (AWS best practice)
- **Route 53** - DNS management for custom domain
- **ACM Certificate** - Free SSL/TLS certificate
- **WAF** - Web Application Firewall protection
- **Automated Deployment** - Script for easy content updates

## Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform >= 1.0 installed
- Domain name (can be registered through Route 53 or external provider)
- Node.js (if using the included Astro example site)

## Quick Start

1. **Clone and navigate to terraform directory:**
   ```bash
   git clone <your-repo>
   cd staticWebsiteHosting/terraform
   ```

2. **Configure variables:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your domain name
   ```

3. **Initialize and deploy:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. **Upload your website:**
   ```bash
   ./deploy.sh
   ```

## Configuration

Edit `terraform.tfvars`:

```hcl
domain_name         = "yourdomain.com"
aws_region         = "eu-central-1"
environment        = "production"
create_hosted_zone = false  # Set to true for new domains
```

## Deployment

The included `deploy.sh` script:
- Builds the Astro site (if using the example)
- Syncs content to S3
- Creates CloudFront invalidation
- Shows deployment status

## Cost Estimation

Monthly costs (low traffic):
- S3 Storage: ~$0.01
- CloudFront: ~$1-5
- Route 53: ~$0.50
- WAF: ~$2-3
- **Total: ~$4-9/month**

SSL certificates are free through ACM.

## Security Features

- Private S3 bucket (no public access)
- Origin Access Control (OAC) 
- HTTPS enforcement
- WAF protection against common attacks
- Encrypted storage

## Customization

### Using Your Own Website

Replace the `dist/` folder contents with your static website files:
- Ensure you have `index.html` and `404.html`
- Update the `deploy.sh` script if needed

### Adding Custom WAF Rules

Edit `waf.tf` to add custom security rules for your specific needs.

### Multi-Environment Setup

Use Terraform workspaces or separate `.tfvars` files:
```bash
terraform workspace new staging
terraform apply -var-file="staging.tfvars"
```

## Outputs

After deployment, Terraform provides:
- Website URL
- CloudFront distribution details
- S3 bucket information
- Certificate ARN

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Troubleshooting

**Certificate validation fails:**
- Ensure DNS records are properly configured
- Wait up to 30 minutes for validation

**CloudFront shows 403 errors:**
- Check S3 bucket policy
- Verify OAC configuration
- Clear CloudFront cache

**Domain not resolving:**
- Verify Route 53 nameservers match your domain registrar
- DNS propagation can take up to 48 hours

## Contributing

This project demonstrates AWS best practices for static website hosting. Feel free to submit issues or improvements.

## License

MIT License - see LICENSE file for details.
