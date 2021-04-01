#!/bin/sh

PIPELINE_ID=$(aws cloudformation \
    list-exports --query "Exports[?Name==\`PipelineID\`].Value" \
    --no-paginate --output text)
CLOUDFRONT_STACK="production-distro"

echo "Deleting bucket: ${PIPELINE_ID}..."
# Delete files in the S3 bucket
aws s3 rm "s3://${PIPELINE_ID}" --recursive
# Delete bucket (through the stack)
aws cloudformation delete-stack --stack-name "stack-${PIPELINE_ID}"

echo
echo "Deleting CloudFront Distribution: ${CLOUDFRONT_STACK}..."
# Delete the CloudFront Distribution (through the stack)
aws cloudformation delete-stack --stack-name "${CLOUDFRONT_STACK}"
