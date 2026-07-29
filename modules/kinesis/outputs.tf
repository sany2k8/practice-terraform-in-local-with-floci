output "stream_name" {
  description = "Name of the stream."
  value       = aws_kinesis_stream.this.name
}

output "stream_arn" {
  description = "ARN of the stream."
  value       = aws_kinesis_stream.this.arn
}
