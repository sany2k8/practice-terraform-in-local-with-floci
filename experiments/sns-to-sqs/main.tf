# Experiment: sns-to-sqs — fan-out. An SNS topic delivers every published
# message into an SQS queue. Two modules composed together here at the root.

module "sqs" {
  source     = "../../modules/sqs"
  queue_name = "jobs-queue"
}

module "sns" {
  source = "../../modules/sns"
  name   = "order-events"
}

# Subscribe the queue to the topic.
resource "aws_sns_topic_subscription" "jobs" {
  topic_arn = module.sns.topic_arn
  protocol  = "sqs"
  endpoint  = module.sqs.queue_arn
}

# Allow the SNS topic to deliver messages into the queue.
resource "aws_sqs_queue_policy" "allow_sns" {
  queue_url = module.sqs.queue_url

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "AllowSNSDelivery"
      Effect    = "Allow"
      Principal = { Service = "sns.amazonaws.com" }
      Action    = "sqs:SendMessage"
      Resource  = module.sqs.queue_arn
      Condition = {
        ArnEquals = { "aws:SourceArn" = module.sns.topic_arn }
      }
    }]
  })
}
