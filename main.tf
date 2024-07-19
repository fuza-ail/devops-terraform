terraform {
  required_version = "1.9.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "ec2_instance" {
  source = "./instance"
}

module "s3-bucket" {
  source = "./s3-bucket"
}