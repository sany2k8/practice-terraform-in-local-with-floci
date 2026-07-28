# Experiment: rds-basics — creates a local RDS Postgres database instance.

module "rds" {
  source  = "../../modules/rds"
  name    = "my-rds-db"
  engine  = "postgres"
  db_name = "testdb"
}
