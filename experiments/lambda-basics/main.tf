# Experiment: lambda-basics — a Python Lambda with its IAM execution role.
# Composes modules/iam (execution role) + modules/lambda (the function).

module "iam" {
  source               = "../../modules/iam"
  name                 = "hello-exec"
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

module "lambda" {
  source        = "../../modules/lambda"
  function_name = "hello"
  role_arn      = module.iam.role_arn
  source_dir    = "${path.module}/src"
  handler       = "handler.lambda_handler"
  runtime       = "python3.12"

  environment = {
    GREETING = "hello"
  }
}
