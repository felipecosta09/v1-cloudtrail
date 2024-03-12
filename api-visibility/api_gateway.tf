resource "aws_api_gateway_rest_api" "logistics_api" {
  name        = "${var.prefix}-logistics-api-${random_string.suffix.result}"
  description = "Logistics API"
}
