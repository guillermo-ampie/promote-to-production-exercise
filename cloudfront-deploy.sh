#!/bin/sh

S3_BUCKET_NAME=
STACK_FILE=cloudfront.yml
STACK_NAME=production-distro
TAGS=project=udapeople

echo "Deploying stack: ${STACK_NAME}..."

aws cloudformation deploy \
--template-file ${STACK_FILE} \
--stack-name ${STACK_NAME} \
--parameter-overrides PipelineID="${S3_BUCKET_NAME}" \ 
--tags ${TAGS}
