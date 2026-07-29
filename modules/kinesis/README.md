# Module: kinesis

Creates a Kinesis Data Stream (PROVISIONED with a shard count, or ON_DEMAND).

## Usage

```hcl
module "kinesis" {
  source      = "../../modules/kinesis"
  name        = "events-stream"
  shard_count = 1
}
```

## Inputs

| Name               | Type          | Default         | Description                              |
|--------------------|---------------|-----------------|------------------------------------------|
| `name`             | `string`      | —               | Stream name (required).                  |
| `stream_mode`      | `string`      | `"PROVISIONED"` | `PROVISIONED` or `ON_DEMAND`.            |
| `shard_count`      | `number`      | `1`             | Shards (PROVISIONED only).               |
| `retention_period` | `number`      | `24`            | Retention in hours (24-8760).            |
| `tags`             | `map(string)` | `{}`            | Tags applied to the stream.              |

## Outputs

| Name          | Description    |
|---------------|----------------|
| `stream_name` | Stream name.   |
| `stream_arn`  | Stream ARN.    |

## Inspect on Floci

```bash
./scripts/awslocal.sh kinesis list-streams
./scripts/awslocal.sh kinesis describe-stream-summary --stream-name events-stream
```
