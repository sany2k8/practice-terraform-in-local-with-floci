# Module: secretsmanager

Creates an AWS Secrets Manager secret (`aws_secretsmanager_secret`) and an optional secret version (`aws_secretsmanager_secret_version`).

## Usage

### Simple secret with raw string or JSON:

```hcl
module "app_secret" {
  source        = "../../modules/secretsmanager"
  name          = "my-app-secret"
  description   = "App API key secret"
  secret_string = "super-secret-api-key"
}
```

### Secret from a key-value map:

```hcl
module "db_secret" {
  source = "../../modules/secretsmanager"
  name   = "my-db-secret"

  secret_key_values = {
    username = "admin"
    password = "SecretPassword123!"
  }
}
```

## Inputs

| Name                      | Type          | Default | Description                                                        |
|---------------------------|---------------|---------|--------------------------------------------------------------------|
| `name`                    | `string`      | —       | Name of the secret (required).                                     |
| `description`             | `string`      | `null`  | Description of the secret.                                         |
| `kms_key_id`              | `string`      | `null`  | KMS key ID or ARN used for encrypting the secret.                  |
| `recovery_window_in_days` | `number`      | `0`     | Deletion recovery window in days (0 for immediate deletion).       |
| `secret_string`           | `string`      | `null`  | Plain text or JSON string for the secret value (sensitive).        |
| `secret_key_values`       | `map(string)` | `null`  | Map of key-values automatically encoded to JSON (sensitive).       |
| `tags`                    | `map(string)` | `{}`    | Tags applied to the secret.                                        |

## Outputs

| Name          | Description                  |
|---------------|------------------------------|
| `secret_id`   | ID of the created secret.    |
| `secret_arn`  | ARN of the created secret.   |
| `secret_name` | Name of the created secret.  |
| `version_id`  | Secret version ID (if set).  |

## Inspect on Floci

```bash
./scripts/awslocal.sh secretsmanager list-secrets
./scripts/awslocal.sh secretsmanager get-secret-value --secret-id <secret-name-or-arn>
```
