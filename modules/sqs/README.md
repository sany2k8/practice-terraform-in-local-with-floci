# Module: sqs

Creates an SQS queue (standard or FIFO).

## Usage

```hcl
module "sqs" {
  source     = "./modules/sqs"
  queue_name = "jobs-queue"
}
```

## Inputs

| Name                         | Type          | Default | Description                              |
|------------------------------|---------------|---------|------------------------------------------|
| `queue_name`                 | `string`      | —       | Queue name (required).                   |
| `fifo_queue`                 | `bool`        | `false` | Create a FIFO queue (name ends `.fifo`). |
| `visibility_timeout_seconds` | `number`      | `30`    | Message visibility timeout.              |
| `tags`                       | `map(string)` | `{}`    | Tags applied to the queue.               |

## Outputs

| Name        | Description   |
|-------------|---------------|
| `queue_url` | Queue URL.    |
| `queue_arn` | Queue ARN.    |

## Inspect on Floci

```bash
./scripts/awslocal.sh sqs list-queues
```
