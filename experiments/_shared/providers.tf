# Shared AWS provider aimed at Floci. Every experiment symlinks this file so the
# provider config lives in exactly one place.
#
# NOTE: there is deliberately NO `endpoints {}` block. Every AWS call is routed
# to Floci by the AWS_ENDPOINT_URL env var (set by ./tf). That is what lets any
# experiment use any service with no provider changes.
provider "aws" {
  region     = "us-east-1"
  access_key = "test"
  secret_key = "test"

  # These checks only make sense against real AWS — skip them for Floci.
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  # Floci serves S3 in path style (http://localhost:4566/<bucket>).
  s3_use_path_style = true
}
