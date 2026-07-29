# Experiment: logs-basics — a CloudWatch log group with a log stream.
module "logs" {
  source            = "../../modules/logs"
  name              = "/myapp/api"
  retention_in_days = 14
  stream_name       = "app-1"
}
