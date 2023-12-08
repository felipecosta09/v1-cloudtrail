resource "aws_apigatewayv2_api" "lambda_api" {
  name          = "serverless_lambda_gw"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "lambda_api_stage" {
  api_id = aws_apigatewayv2_api.lambda_api.id
  name        = "stage${random_string.suffix.result}"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda_api_integration" {
  api_id = aws_apigatewayv2_api.lambda_api.id
  integration_uri    = aws_lambda_function.lambda.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "lambda_api_route" {
  api_id = aws_apigatewayv2_api.lambda_api.id
  route_key = "GET /website"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_api_integration.id}"
}

resource "aws_cloudwatch_log_group" "api_gw" {
  name = "/aws/api_gw/${aws_apigatewayv2_api.lambda_api.name}"
  retention_in_days = 30
}
