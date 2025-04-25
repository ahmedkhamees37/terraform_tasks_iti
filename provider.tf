terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # Configure remote backend here for team collaboration
    # bucket         = "your-terraform-state-bucket"
    # key            = "path/to/your/statefile"
    # region         = "us-east-1"
    # dynamodb_table = "your-lock-table"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = var.tags
  }
}