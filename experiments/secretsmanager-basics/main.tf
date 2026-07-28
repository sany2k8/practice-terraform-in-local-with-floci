# Experiment: secretsmanager-basics

module "secretsmanager" {
  source        = "../../modules/secretsmanager"
  name          = "my-app-secret"
  description   = "Sample secret created for testing with Floci"
  secret_string = "my-super-secret-password-123"
}

