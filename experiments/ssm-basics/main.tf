# Experiment: ssm-basics — two Parameter Store values: a plain String and an
# encrypted SecureString. Instantiates modules/ssm twice.
module "db_host" {
  source = "../../modules/ssm"
  name   = "/myapp/db/host"
  value  = "db.internal.local"
}

module "db_password" {
  source = "../../modules/ssm"
  name   = "/myapp/db/password"
  type   = "SecureString"
  value  = "s3cr3t-p@ssw0rd"
}
