# Module: lambda

Packages a source directory into a zip and creates a Lambda function. Needs an
IAM execution role ARN (build one with `modules/iam`, trust `lambda.amazonaws.com`).

Uses the `hashicorp/archive` provider to build the deployment package (declared in
this module's `versions.tf`, so `terraform init` fetches it automatically).

## Usage

```hcl
module "iam" {
  source               = "../../modules/iam"
  name                 = "hello-exec"
  assume_role_services = ["lambda.amazonaws.com"]
}

module "lambda" {
  source        = "../../modules/lambda"
  function_name = "hello"
  role_arn      = module.iam.role_arn
  source_dir    = "${path.module}/src"
  handler       = "handler.lambda_handler"
  runtime       = "python3.12"
}
```

## Inputs

| Name            | Type          | Default                    | Description                          |
|-----------------|---------------|----------------------------|--------------------------------------|
| `function_name` | `string`      | —                          | Function name (required).            |
| `role_arn`      | `string`      | —                          | Execution role ARN (required).       |
| `source_dir`    | `string`      | —                          | Dir zipped as the package (required).|
| `handler`       | `string`      | `"handler.lambda_handler"` | Entrypoint.                          |
| `runtime`       | `string`      | `"python3.12"`             | Runtime.                             |
| `timeout`       | `number`      | `10`                       | Timeout (s).                         |
| `memory_size`   | `number`      | `128`                      | Memory (MB).                         |
| `environment`   | `map(string)` | `{}`                       | Env vars.                            |
| `tags`          | `map(string)` | `{}`                       | Tags.                                |

## Outputs

| Name            | Description         |
|-----------------|---------------------|
| `function_name` | Function name.      |
| `function_arn`  | Function ARN.       |
| `invoke_arn`    | Invoke ARN.         |

## Inspect / invoke on Floci

```bash
./scripts/awslocal.sh lambda list-functions
./scripts/awslocal.sh lambda invoke --function-name hello --payload '{}' /tmp/out.json && cat /tmp/out.json
```
