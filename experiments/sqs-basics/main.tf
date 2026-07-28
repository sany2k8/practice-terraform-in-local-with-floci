# Experiment: sqs-basics — a standard SQS queue.
module "sqs" {
  source     = "../../modules/sqs"
  queue_name = "jobs-queue"
}
