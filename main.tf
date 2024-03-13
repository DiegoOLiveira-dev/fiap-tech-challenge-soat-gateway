provider "aws" {
  region = "us-east-1" # substitua pela região desejada
}

resource "aws_api_gateway_rest_api" "my_api" {
  name        = "my-api"
  description = "My API Gateway"
}

resource "aws_api_gateway_authorizer" "my_authorizer" {
  name          = "my-authorizer"
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  type          = "COGNITO_USER_POOLS"
  provider_arns = [var.cognito_arn]
}

resource "aws_api_gateway_resource" "my_resource" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  parent_id   = aws_api_gateway_rest_api.my_api.root_resource_id
  path_part   = "products"
}

resource "aws_api_gateway_method" "get_method" {
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  resource_id   = aws_api_gateway_resource.my_resource.id
  http_method   = "GET"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.my_authorizer.id
}

resource "aws_api_gateway_integration" "my_integration" {
  rest_api_id             = aws_api_gateway_rest_api.my_api.id
  resource_id             = aws_api_gateway_resource.my_resource.id
  http_method             = aws_api_gateway_method.get_method.http_method
  integration_http_method = "GET"
  type                    = "HTTP"
  uri                     = var.product_url # Substitua pela URL do seu endpoint
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.my_resource.id
  http_method = aws_api_gateway_method.get_method.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "integration_response_200" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.my_resource.id
  http_method = aws_api_gateway_method.get_method.http_method
  status_code = aws_api_gateway_method_response.response_200.status_code
  response_templates = {
    "application/json" = ""
  }
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.my_integration,
    aws_api_gateway_integration_response.integration_response_200
  ]
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  stage_name  = "dev" # Substitua pelo nome do seu estágio
}








