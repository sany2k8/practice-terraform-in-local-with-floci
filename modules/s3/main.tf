resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
  count  = var.versioning ? 1 : 0
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

# A sample object so there's something to `aws s3 ls` right after apply.
resource "aws_s3_object" "hello" {
  bucket  = aws_s3_bucket.this.id
  key     = "hello.txt"
  content = "Hello from Terraform + Floci!"
}
