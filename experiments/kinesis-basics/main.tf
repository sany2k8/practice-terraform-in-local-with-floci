# Experiment: kinesis-basics — a single-shard Kinesis data stream.
module "kinesis" {
  source      = "../../modules/kinesis"
  name        = "events-stream"
  shard_count = 1
}
