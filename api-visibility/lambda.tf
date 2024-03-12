resource "aws_lambda_function" "lambda_orders" {
  function_name = "${var.prefix}-lambda-orders-${random_string.suffix.result}"
  handler      = "index.handler"
  runtime      = "nodejs20.x"
  role        = aws_iam_role.lambda_role.arn
  filename    = "zip/lambda.zip"
  tags = {
    Name = "${var.prefix}-lambda-orders-${random_string.suffix.result}"
    Environment = var.environment
    CostCenter = var.cost-center
  }
}

resource "aws_lambda_function" "lambda_shipments" {
  function_name = "${var.prefix}-lambda-shipments-${random_string.suffix.result}"
  handler      = "index.handler"
  runtime      = "nodejs20.x"
  role        = aws_iam_role.lambda_role.arn
  filename    = "zip/lambda.zip"
  tags = {
    Name = "${var.prefix}-lambda-shipments-${random_string.suffix.result}"
    Environment = var.environment
    CostCenter = var.cost-center
  }
}

resource "aws_lambda_function" "lambda_login" {
  function_name = "${var.prefix}-lambda-login-${random_string.suffix.result}"
  handler      = "index.handler"
  runtime      = "nodejs20.x"
  role        = aws_iam_role.lambda_role.arn
  filename    = "zip/lambda.zip"
  tags = {
    Name = "${var.prefix}-lambda-login-${random_string.suffix.result}"
    Environment = var.environment
    CostCenter = var.cost-center
  }
}