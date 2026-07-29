resource "aws_kinesis_stream" "this" {
  name             = var.name
  retention_period = var.retention_period

  # shard_count is required for PROVISIONED mode and must be null for ON_DEMAND.
  shard_count = var.stream_mode == "PROVISIONED" ? var.shard_count : null

  stream_mode_details {
    stream_mode = var.stream_mode
  }

  tags = var.tags
}
