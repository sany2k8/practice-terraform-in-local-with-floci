# Experiment: s3-basics — a versioned S3 bucket with a sample object.
module "s3" {
  source      = "../../modules/s3"
  bucket_name = "my-first-floci-bucket"
  versioning  = true
}
