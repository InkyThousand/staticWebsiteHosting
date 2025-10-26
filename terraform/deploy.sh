#!/bin/bash

# Static Website Deployment Script
# This script builds the Astro site and syncs it to S3

set -e

echo "🚀 Starting deployment process..."

# Build the Astro site
echo "📦 Building Astro site..."
cd ..
npm run build

# Get the S3 bucket name from Terraform output
echo "🔍 Getting S3 bucket name..."
cd terraform
BUCKET_NAME=$(terraform output -raw s3_bucket_name)

if [ -z "$BUCKET_NAME" ]; then
    echo "❌ Error: Could not get S3 bucket name from Terraform output"
    echo "Make sure you have run 'terraform apply' first"
    exit 1
fi

echo "📤 Uploading files to S3 bucket: $BUCKET_NAME"

# Sync the dist folder to S3
aws s3 sync ../dist/ s3://$BUCKET_NAME/ --delete --cache-control "max-age=86400"

# Get CloudFront distribution ID
DISTRIBUTION_ID=$(terraform output -raw cloudfront_distribution_id)

if [ -n "$DISTRIBUTION_ID" ]; then
    echo "🔄 Creating CloudFront invalidation..."
    aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*"
    echo "✅ Invalidation created for distribution: $DISTRIBUTION_ID"
else
    echo "⚠️  Warning: Could not get CloudFront distribution ID"
fi

echo "🎉 Deployment completed successfully!"
echo "🌐 Website URL: $(terraform output -raw website_url)"
