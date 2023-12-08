resource "aws_lambda_function" "lambda" {
  function_name = "${var.prefix}-lambda-${random_string.suffix.result}"
  description   = "API Visibility Lambda"
  filename      = "${path.module}/zip/lambda.zip"
  architectures  = ["arm64"]
  memory_size = 128
  timeout = 5
  handler = "handler.handler"
  runtime = "nodejs16.x"
  role = "${aws_iam_role.lambda_role.arn}"
  tags = {
    Name = "${var.prefix}-lambda-${random_string.suffix.result}"
  }
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda.function_name}"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.api_gateway.execution_arn}/*/*"
}

resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.lambda_api.execution_arn}/*/*"
}