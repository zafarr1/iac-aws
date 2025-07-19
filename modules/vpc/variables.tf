variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
  default     = "demo"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets_cidr" {
  type        = list(string)
  description = "List of CIDRs for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "List of CIDRs for private subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
