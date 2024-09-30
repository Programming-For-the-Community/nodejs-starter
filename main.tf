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

module "network" {
  source        = "./Terraform/network"
  resource_tags = var.resource_tags
  vpc_id        = var.vpc_id
  subnet_a_cidr = var.subnet_a_cidr
  subnet_b_cidr = var.subnet_b_cidr
  subnet_c_cidr = var.subnet_c_cidr
}