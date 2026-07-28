# Experiment: dynamodb-basics — a pay-per-request table with a single hash key.
module "dynamodb" {
  source     = "../../modules/dynamodb"
  table_name = "users"
  hash_key   = "user_id"
}
