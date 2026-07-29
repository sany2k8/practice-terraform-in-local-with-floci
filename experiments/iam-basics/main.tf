# Experiment: iam-basics — a role assumable by Lambda, with an inline policy
# granting CloudWatch Logs access (the classic Lambda execution role).
module "iam" {
  source               = "../../modules/iam"
  name                 = "lambda-exec"
  assume_role_services = ["lambda.amazonaws.com"]

  inline_policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
      Resource = "*"
    }]
  })
}
