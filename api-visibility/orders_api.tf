resource "aws_api_gateway_resource" "resource_orders" {
  rest_api_id = aws_api_gateway_rest_api.logistics_api.id
  parent_id   = aws_api_gateway_rest_api.logistics_api.root_resource_id
  path_part   = "orders"
}

resource "aws_api_gateway_method" "method_orders" {
  rest_api_id   = aws_api_gateway_rest_api.logistics_api.id
  resource_id   = aws_api_gateway_resource.resource_orders.id
  http_method   = "POST"
  authorization = "AWS_IAM"
}

resource "aws_api_gateway_integration" "integration_orders" {
  rest_api_id             = aws_api_gateway_rest_api.logistics_api.id
  resource_id             = aws_api_gateway_resource.resource_orders.id
  http_method             = aws_api_gateway_method.method_orders.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_orders.invoke_arn
}