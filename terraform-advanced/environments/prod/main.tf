terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "ap-south-1"
  access_key                  = "fake"
  secret_key                  = "fake"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3  = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}

# VPC module — no hardcoded values
module "vpc" {
  source              = "../../modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az                  = var.az
  environment         = var.environment
}

# Security Group module
module "security_group" {
  source      = "../../modules/security_group"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

# EC2 module
module "ec2" {
  source            = "../../modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  environment       = var.environment
}
