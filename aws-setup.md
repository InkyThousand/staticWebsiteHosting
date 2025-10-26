# AWS S3 Static Website Setup

## 1. Create S3 Bucket
```bash
aws s3 mb s3://your-portfolio-bucket
```

## 2. Enable Static Website Hosting
```bash
aws s3 website s3://your-portfolio-bucket \
  --index-document index.html \
  --error-document 404.html
```

## 3. Set Bucket Policy (Public Read)
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-portfolio-bucket/*"
    }
  ]
}
```

Apply policy:
```bash
aws s3api put-bucket-policy \
  --bucket your-portfolio-bucket \
  --policy file://bucket-policy.json
```

## 4. Deploy Your Site
```bash
# Build static files
npm run build

# Upload to S3
aws s3 sync dist/ s3://your-portfolio-bucket --delete
```

## 5. Access Your Website
- **S3 URL**: http://your-portfolio-bucket.s3-website-us-east-1.amazonaws.com
- **Custom Domain**: Configure Route 53 + CloudFront