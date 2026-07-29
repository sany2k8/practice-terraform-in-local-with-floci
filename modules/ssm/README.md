# Module: ssm

Creates a Systems Manager (SSM) Parameter Store parameter — a `String`,
`StringList`, or encrypted `SecureString`.

## Usage

```hcl
module "ssm" {
  source = "../../modules/ssm"
  name   = "/myapp/db/host"
  value  = "db.internal.local"
}
```

## Inputs

| Name     | Type          | Default      | Description                                    |
|----------|---------------|--------------|------------------------------------------------|
| `name`   | `string`      | —            | Parameter name/path (required).                |
| `value`  | `string`      | —            | Value to store (required, sensitive).          |
| `type`   | `string`      | `"String"`   | `String`, `StringList`, or `SecureString`.     |
| `key_id` | `string`      | `null`       | KMS key for `SecureString` (AWS-managed default). |
| `tier`   | `string`      | `"Standard"` | `Standard`, `Advanced`, `Intelligent-Tiering`. |
| `tags`   | `map(string)` | `{}`         | Tags applied to the parameter.                 |

## Outputs

| Name      | Description         |
|-----------|---------------------|
| `name`    | Parameter name.     |
| `arn`     | Parameter ARN.      |
| `version` | Parameter version.  |

## Inspect on Floci

```bash
./scripts/awslocal.sh ssm describe-parameters
./scripts/awslocal.sh ssm get-parameter --name /myapp/db/host
./scripts/awslocal.sh ssm get-parameter --name /myapp/db/password --with-decryption
```
