output "api_domain" {
  value = aws_api_gateway_stage.api.invoke_url
}

output "s3_bucket" {
  value = aws_s3_bucket.front_end_app.website_endpoint
}
