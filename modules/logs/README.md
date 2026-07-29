# Module: logs

Creates a CloudWatch Logs log group with a retention policy, plus an optional
log stream inside it.

## Usage

```hcl
module "logs" {
  source            = "../../modules/logs"
  name              = "/myapp/api"
  retention_in_days = 14
  stream_name       = "app-1"
}
```

## Inputs

| Name                | Type          | Default | Description                              |
|---------------------|---------------|---------|------------------------------------------|
| `name`              | `string`      | —       | Log group name (required).               |
| `retention_in_days` | `number`      | `7`     | Retention (0 = never expire).            |
| `stream_name`       | `string`      | `null`  | Optional log stream to create.           |
| `tags`              | `map(string)` | `{}`    | Tags applied to the log group.           |

## Outputs

| Name             | Description                  |
|------------------|------------------------------|
| `log_group_name` | Log group name.              |
| `log_group_arn`  | Log group ARN.               |
| `stream_name`    | Log stream name (if created).|

## Inspect on Floci

```bash
./scripts/awslocal.sh logs describe-log-groups
./scripts/awslocal.sh logs describe-log-streams --log-group-name /myapp/api
```
