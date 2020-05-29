terraform {
  required_version = "> 0.12.0"
  backend "s3" {
    bucket         = "dino-terraformclass"
    key            = "environments/dev/terraform.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  version = "~> 2.7"
  region  = "us-east-1"
}