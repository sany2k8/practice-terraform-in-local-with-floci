# Module: kms

Creates a KMS customer-managed key with an optional alias.

## Usage

```hcl
module "kms" {
  source     = "../../modules/kms"
  alias_name = "app-secrets"
}
```

## Inputs

| Name                      | Type          | Default | Description                              |
|---------------------------|---------------|---------|------------------------------------------|
| `description`             | `string`      | "Managed by Terraform (Floci lab)" | Key description.      |
| `alias_name`              | `string`      | `null`  | Alias without the `alias/` prefix.       |
| `deletion_window_in_days` | `number`      | `7`     | Deletion waiting period (7-30).          |
| `enable_key_rotation`     | `bool`        | `false` | Enable annual key rotation.              |
| `tags`                    | `map(string)` | `{}`    | Tags applied to the key.                 |

## Outputs

| Name        | Description                    |
|-------------|-------------------------------|
| `key_id`    | Key ID.                       |
| `key_arn`   | Key ARN.                      |
| `alias_arn` | Alias ARN (if created).       |

## Inspect on Floci

```bash
./scripts/awslocal.sh kms list-keys
./scripts/awslocal.sh kms list-aliases
```
