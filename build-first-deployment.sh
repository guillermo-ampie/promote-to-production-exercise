#!/bin/sh

S3_BUCKET_NAME="b000001"
STACK_FILE="cloudfront.yml"
STACK_NAME="production-distro"
TAGS="project=udapeople"


echo "Building first deployment..."

echo "Creating bucket: ${S3_BUCKET_NAME}..."
aws cloudformation deploy \
    --template-file bucket.yml \
    --stack-name "stack-${S3_BUCKET_NAME}" \
    --parameter-overrides BUCKETNAME="${S3_BUCKET_NAME}"

echo "Syncing files to bucket: ${S3_BUCKET_NAME}..."
aws s3 sync . s3://"${S3_BUCKET_NAME}" --delete

echo "Deploying stack: ${STACK_NAME}..."
aws cloudformation deploy \
    --template-file ${STACK_FILE} \
    --stack-name ${STACK_NAME} \
    --parameter-overrides PipelineID=${S3_BUCKET_NAME} \
    --tags ${TAGS}
