#!/bin/sh

S3_BUCKET_NAME="sample-aaa001"
CLOUDFRONT_STACK_FILE="cloudfront.yml"
CLOUDFRONT_STACK_NAME="cloudfront-dist"
TAGS="promote=blue-green"

echo "Building first deployment..."

echo "Creating bucket: ${S3_BUCKET_NAME}..."
aws cloudformation deploy \
    --template-file bucket.yml \
    --stack-name "stack-${S3_BUCKET_NAME}" \
    --parameter-overrides BUCKETNAME="${S3_BUCKET_NAME}"

echo
echo "Syncing files to bucket: ${S3_BUCKET_NAME}..."
aws s3 sync . s3://"${S3_BUCKET_NAME}" --delete --exclude ".*"

echo
echo "Deploying stack: ${CLOUDFRONT_STACK_NAME}..."
aws cloudformation deploy \
    --template-file ${CLOUDFRONT_STACK_FILE} \
    --stack-name ${CLOUDFRONT_STACK_NAME} \
    --parameter-overrides PipelineID=${S3_BUCKET_NAME} \
    --tags ${TAGS}
