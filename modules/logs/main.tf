resource "aws_cloudwatch_log_group" "this" {
  name              = var.name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

# Optional log stream inside the group.
resource "aws_cloudwatch_log_stream" "this" {
  count          = var.stream_name != null ? 1 : 0
  name           = var.stream_name
  log_group_name = aws_cloudwatch_log_group.this.name
}
