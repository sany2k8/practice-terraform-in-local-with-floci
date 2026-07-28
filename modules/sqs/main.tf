resource "aws_sqs_queue" "this" {
  name                       = var.queue_name
  fifo_queue                 = var.fifo_queue
  visibility_timeout_seconds = var.visibility_timeout_seconds
  tags                       = var.tags
}
