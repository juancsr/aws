terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      "Environment" = "Development"
      "Project"     = "FargateExample"
    }
  }

  assume_role {
    role_arn     = "arn:aws:iam::138021360462:role/terraform-fargate-example"
    session_name = "fargate-example-session"
  }
}
