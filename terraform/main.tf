terraform {
  required_version = "~> 1.1.5"
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  default_tags {
    tags = local.tags
  }
}
