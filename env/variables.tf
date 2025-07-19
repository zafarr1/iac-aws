variable "name_prefix" {
  type    = string
  default = "demo"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "ami" {
  type = string
  description = "AMI ID"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type = string
  description = "Key pair name"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "backend_bucket" {
  type = string
  description = "S3 bucket name for terraform backend"
}

variable "backend_dynamodb_table" {
  type = string
  description = "DynamoDB table name for terraform backend state locking"
}
