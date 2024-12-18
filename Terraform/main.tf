terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    bucket = "nodejs-starter-tfstate-048908104884"
    region = "us-east-2"
    key    = "nodejs-starter.tfstate"
  }

}

provider "aws" {
  profile = "default"
  region  = var.region
}