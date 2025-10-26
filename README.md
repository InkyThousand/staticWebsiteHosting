# AWS Static Website Hosting

A complete solution for hosting static websites on AWS using modern cloud architecture and Infrastructure as Code (Terraform).

## 🏗️ Architecture

This project demonstrates enterprise-grade static website hosting with:

- **S3** - Secure private bucket storage
- **CloudFront** - Global CDN with custom domain
- **Route 53** - DNS management
- **ACM** - Free SSL/TLS certificates
- **WAF** - Web Application Firewall protection
- **Origin Access Control** - AWS security best practices

## 🚀 Features

- ✅ **Secure by Design** - Private S3 bucket with OAC
- ✅ **Global Performance** - CloudFront CDN
- ✅ **Custom Domain** - Professional branding with SSL
- ✅ **Enterprise Security** - WAF protection against common attacks
- ✅ **Infrastructure as Code** - Fully automated with Terraform
- ✅ **Cost Optimized** - ~$4-9/month for low traffic sites
- ✅ **Production Ready** - Follows AWS Well-Architected principles

## 📁 Project Structure

```
├── src/                    # Astro source files
├── dist/                   # Built static files
├── terraform/              # Infrastructure as Code
│   ├── main.tf            # Provider configuration
│   ├── s3.tf              # S3 bucket setup
│   ├── cloudfront.tf      # CDN configuration
│   ├── route53.tf         # DNS management
│   ├── acm.tf             # SSL certificates
│   ├── waf.tf             # Security rules
│   ├── variables.tf       # Input variables
│   ├── outputs.tf         # Resource outputs
│   └── deploy.sh          # Deployment script
└── README.md              # This file
```

## 🛠️ Quick Start

### Prerequisites
- AWS CLI configured
- Terraform >= 1.0
- Node.js (for Astro site)
- Domain name

### Deployment

1. **Clone and configure:**
   ```bash
   git clone <your-repo>
   cd staticWebsiteHosting/terraform
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your domain
   ```

2. **Deploy infrastructure:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. **Deploy website:**
   ```bash
   ./deploy.sh
   ```

## 💰 Cost Breakdown

Estimated monthly costs for low-traffic sites:
- S3 Storage: ~$0.01
- CloudFront: ~$1-5
- Route 53: ~$0.50
- WAF: ~$2-3
- **Total: ~$4-9/month**

*SSL certificates are free through ACM*

## 🔒 Security Features

- **Private S3 Bucket** - No public access
- **Origin Access Control** - CloudFront-only access
- **HTTPS Enforcement** - Automatic HTTP to HTTPS redirect
- **WAF Protection** - Blocks common web attacks
- **Encrypted Storage** - S3 server-side encryption

## 🌐 Live Demo

Visit the deployed site: [inkyrein.click](https://inkyrein.click)

## 📚 Learning Outcomes

This project demonstrates:
- AWS cloud architecture design
- Infrastructure as Code with Terraform
- CDN and DNS configuration
- SSL/TLS certificate management
- Web security best practices
- Cost optimization strategies

## 🤝 Contributing

This is a learning project showcasing AWS best practices. Feel free to:
- Report issues
- Suggest improvements
- Fork for your own use

## 📄 License

MIT License - Feel free to use this project for learning and development.

---

*This project was built as part of my AWS cloud engineering journey, demonstrating practical application of cloud services and Infrastructure as Code principles.*
