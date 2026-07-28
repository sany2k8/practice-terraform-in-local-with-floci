# Module: dynamodb

Creates a DynamoDB table with a single partition (hash) key.

## Usage

```hcl
module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = "users"
  hash_key   = "user_id"
}
```

## Inputs

| Name           | Type          | Default            | Description                          |
|----------------|---------------|--------------------|--------------------------------------|
| `table_name`   | `string`      | —                  | Table name (required).               |
| `hash_key`     | `string`      | —                  | Partition key attribute (required).  |
| `hash_key_type`| `string`      | `"S"`              | `S`, `N`, or `B`.                    |
| `billing_mode` | `string`      | `"PAY_PER_REQUEST"`| Billing mode.                        |
| `tags`         | `map(string)` | `{}`               | Tags applied to the table.           |

## Outputs

| Name         | Description        |
|--------------|--------------------|
| `table_name` | Table name.        |
| `table_arn`  | Table ARN.         |

## Inspect on Floci

```bash
./scripts/awslocal.sh dynamodb list-tables
./scripts/awslocal.sh dynamodb describe-table --table-name users
```
