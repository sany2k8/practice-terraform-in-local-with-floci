# Experiment: kms-basics — a customer-managed KMS key with a friendly alias.
module "kms" {
  source      = "../../modules/kms"
  description = "App secrets encryption key"
  alias_name  = "app-secrets"
}
