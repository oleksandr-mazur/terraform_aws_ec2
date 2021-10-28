terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.63.0"
    }
  }

  # backend "s3" {
  #   bucket = "terraform-state"
  #   key    = "state/terraform.tfstate"
  #   region = "eu-central-1"
  # }
}

provider "aws" {
  region = local.aws_region
}
