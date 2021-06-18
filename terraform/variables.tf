variable "region" {
  default = "us-east-1"
}

variable "prefix" {
  type        = string
  description = "A prefix to use when naming resources."
  default     = "dev"
}

variable "slack_webhook_url" {
  type        = string
}

variable "vpc_name" {
  default = "dev"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list
  default = ["us-east-1a", "us-east-1b"]
}

variable "private_subnet_cidrs" {
  type    = list
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidrs" {
  type    = list
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "db_subnet_cidrs" {
  type    = list
  default = ["10.0.201.0/24", "10.0.202.0/24"]
}
