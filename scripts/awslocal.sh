#!/usr/bin/env bash
# Thin wrapper so `aws` talks to Floci instead of real AWS.
# Usage:  ./scripts/awslocal.sh s3 ls
#         ./scripts/awslocal.sh dynamodb list-tables
#         ./scripts/awslocal.sh sqs list-queues
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
aws --endpoint-url=http://localhost:4566 "$@"
