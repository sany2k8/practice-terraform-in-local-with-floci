# Module: iam

Creates an IAM role with a trust (assume-role) policy for one or more AWS service
principals, plus an optional inline policy.

## Usage

```hcl
module "iam" {
  source               = "../../modules/iam"
  name                 = "lambda-exec"
  assume_role_services = ["lambda.amazonaws.com"]
  inline_policy_json = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = ["logs:*"], Resource = "*" }]
  })
}
```

## Inputs

| Name                   | Type           | Default                   | Description                         |
|------------------------|----------------|---------------------------|-------------------------------------|
| `name`                 | `string`       | —                         | Role name (required).               |
| `assume_role_services` | `list(string)` | `["ec2.amazonaws.com"]`   | Service principals that can assume. |
| `inline_policy_json`   | `string`       | `null`                    | Optional inline policy JSON.        |
| `tags`                 | `map(string)`  | `{}`                      | Tags applied to the role.           |

## Outputs

| Name        | Description        |
|-------------|--------------------|
| `role_name` | Role name.         |
| `role_arn`  | Role ARN.          |
| `role_id`   | Role unique ID.    |

## Inspect on Floci

```bash
./scripts/awslocal.sh iam list-roles
./scripts/awslocal.sh iam get-role --role-name lambda-exec
./scripts/awslocal.sh iam list-role-policies --role-name lambda-exec
```
