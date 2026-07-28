# Module: sns

Creates an SNS topic. Subscriptions (e.g. fan-out to an SQS queue) are composed
at the root `main.tf` by feeding this module's `topic_arn` into an
`aws_sns_topic_subscription`.

## Usage

```hcl
module "sns" {
  source = "./modules/sns"
  name   = "order-events"
}
```

## Inputs

| Name   | Type          | Default | Description                  |
|--------|---------------|---------|------------------------------|
| `name` | `string`      | —       | Topic name (required).       |
| `tags` | `map(string)` | `{}`    | Tags applied to the topic.   |

## Outputs

| Name         | Description   |
|--------------|---------------|
| `topic_arn`  | Topic ARN.    |
| `topic_name` | Topic name.   |

## Inspect on Floci

```bash
./scripts/awslocal.sh sns list-topics
./scripts/awslocal.sh sns list-subscriptions
```
