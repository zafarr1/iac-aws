terraform {
  required_version = ">= 1.3"

  backend "s3" {
    bucket = var.backend_bucket
    key    = "terraform.tfstate"
    region = var.aws_region
    dynamodb_table = var.backend_dynamodb_table
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "../modules/vpc"
  name_prefix          = var.name_prefix
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}

module "ec2" {
  source          = "../modules/ec2"
  name_prefix     = var.name_prefix
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
}
