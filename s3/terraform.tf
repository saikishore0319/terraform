terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.7.0"
    }
  }

  # backend "s3" {
  #   bucket = "state-bucket-2025-2025"
  #   key = "terraform.tfstate"
  #   region = "ap-south-1"
  #   dynamodb_endpoint = "state_table"
  # }
}

