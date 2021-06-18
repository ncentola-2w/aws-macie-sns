# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"
#   version = "2.77.0"
#
#   name              = var.vpc_name
#   cidr              = var.vpc_cidr
#
#   azs               = var.azs
#   private_subnets   = var.private_subnet_cidrs
#   public_subnets    = var.public_subnet_cidrs
#   database_subnets  = var.db_subnet_cidrs
#
#   # enable_dns_support   = true
#   # enable_dns_hostnames = true
# }
