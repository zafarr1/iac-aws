variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "ami" {
  type        = string
  description = "AMI ID to use"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Key pair name"
}
