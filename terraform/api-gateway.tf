
resource "aws_api_gateway_rest_api" "api" {
  name        = local.app_name
  description = "API for ${local.app_name}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "api" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "mock"

  triggers = {
    "apiHash" = md5(file("api-gateway.tf")),
    "lambda"  = md5(file("lambda.tf")),
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_api_gateway_integration.greeter,
    aws_api_gateway_integration.options_greeter,
  ]
}

resource "aws_api_gateway_stage" "api" {
  stage_name    = var.environment
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.api.id
}
