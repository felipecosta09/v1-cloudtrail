resource "aws_api_gateway_resource" "resource_shipments" {
  rest_api_id = aws_api_gateway_rest_api.logistics_api.id
  parent_id   = aws_api_gateway_rest_api.logistics_api.root_resource_id
  path_part   = "shipments"
}

resource "aws_api_gateway_method" "method_shipments" {
  rest_api_id   = aws_api_gateway_rest_api.logistics_api.id
  resource_id   = aws_api_gateway_resource.resource_shipments.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration_shipments" {
  rest_api_id             = aws_api_gateway_rest_api.logistics_api.id
  resource_id             = aws_api_gateway_resource.resource_shipments.id
  http_method             = aws_api_gateway_method.method_shipments.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_shipments.invoke_arn
}