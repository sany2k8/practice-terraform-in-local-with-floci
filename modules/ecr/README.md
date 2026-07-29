# Module: ecr

Creates an Elastic Container Registry (ECR) repository to hold Docker images.

## Usage

```hcl
module "ecr" {
  source = "../../modules/ecr"
  name   = "my-app"
}
```

## Inputs

| Name                   | Type          | Default     | Description                            |
|------------------------|---------------|-------------|----------------------------------------|
| `name`                 | `string`      | —           | Repository name (required).            |
| `image_tag_mutability` | `string`      | `"MUTABLE"` | `MUTABLE` or `IMMUTABLE`.              |
| `scan_on_push`         | `bool`        | `true`      | Scan images on push.                   |
| `force_delete`         | `bool`        | `true`      | Allow delete with images present.      |
| `tags`                 | `map(string)` | `{}`        | Tags applied to the repository.        |

## Outputs

| Name              | Description                        |
|-------------------|------------------------------------|
| `repository_name` | Repository name.                   |
| `repository_url`  | Push/pull URL.                     |
| `repository_arn`  | Repository ARN.                    |

## Inspect on Floci

```bash
./scripts/awslocal.sh ecr describe-repositories
./scripts/awslocal.sh ecr list-images --repository-name my-app
```
