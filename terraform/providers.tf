terraform {

  backend "s3" {
    bucket = "ps-ncentola-2w-tf-state-us-east-1"
    key    = "macie.tfstate"
    region = "us-east-1"
    profile = "2w"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.36.0"
    }
  }

  required_version = ">= 0.14.0, < 0.15.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "2w"
}
