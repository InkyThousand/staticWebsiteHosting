#!/bin/bash

# Build the static site
echo "Building static site..."
npm run build

# Upload to S3 (replace with your bucket name)
BUCKET_NAME="your-portfolio-bucket"

echo "Uploading to S3..."
aws s3 sync dist/ s3://$BUCKET_NAME --delete

# Optional: Invalidate CloudFront cache
# aws cloudfront create-invalidation --distribution-id YOUR_DISTRIBUTION_ID --paths "/*"

echo "Deployment complete!"
echo "Website URL: http://$BUCKET_NAME.s3-website-us-east-1.amazonaws.com"