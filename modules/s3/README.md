# Module: s3

Creates an S3 bucket (optionally versioned) with a sample object.

## Usage

```hcl
module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-bucket"
  versioning  = true
  tags        = { env = "lab" }
}
```

## Inputs

| Name          | Type          | Default | Description                         |
|---------------|---------------|---------|-------------------------------------|
| `bucket_name` | `string`      | —       | Name of the bucket (required).      |
| `versioning`  | `bool`        | `false` | Enable object versioning.           |
| `tags`        | `map(string)` | `{}`    | Tags applied to the bucket.         |

## Outputs

| Name         | Description            |
|--------------|------------------------|
| `bucket_id`  | Bucket name (ID).      |
| `bucket_arn` | Bucket ARN.            |

## Inspect on Floci

```bash
./scripts/awslocal.sh s3 ls
./scripts/awslocal.sh s3 ls s3://my-bucket
```
