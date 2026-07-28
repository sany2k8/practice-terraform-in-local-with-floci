output "queue_url" {
  description = "URL of the queue."
  value       = aws_sqs_queue.this.url
}

output "queue_arn" {
  description = "ARN of the queue."
  value       = aws_sqs_queue.this.arn
}
