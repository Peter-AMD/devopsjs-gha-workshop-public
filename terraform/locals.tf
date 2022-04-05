locals {
  attendee_name = terraform.workspace
  app_name      = "devopsjs-gha-workshop-${local.attendee_name}"

  fe_bucket_name = "devopsjs-gha-workshop-${local.attendee_name}-${var.aws_region}-${var.environment}"
  tags = {
    ManagedBy   = "terraform"
    Application = local.app_name
    Owner       = "davidrv87"
    GitRepo     = "davidrv87/devopsjs-gha-workshop"
    Environment = var.environment
  }

  lambda_name_greeter = "lambda-greeter-${local.attendee_name}"
  code_s3_bucket      = "devopsjs-gha-workshop-${var.environment}-lambdas"
}
