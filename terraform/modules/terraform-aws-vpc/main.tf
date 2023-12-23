provider "aws" {
  region = var.vpc_region
}

# Filter out local zones, which are not currently supported
# with managed node groups
data "aws_availability_zones" "this" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


locals {
  aws_availability_zones_names = slice(data.aws_availability_zones.this.names, 0, 3)
  aws_availability_zones_count = length(local.aws_availability_zones_names)
  vpc_cidr                     = format("10.%s.0.0/16", var.global_id)
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = module.context.id

  cidr = local.vpc_cidr
  azs  = local.aws_availability_zones_names

  private_subnets = [
    for i in range(local.aws_availability_zones_count) :
    cidrsubnet(cidrsubnet(local.vpc_cidr, 1, 0), 7, i + local.aws_availability_zones_count)
  ]
  public_subnets = [
    for i in range(local.aws_availability_zones_count) :
    cidrsubnet(cidrsubnet(local.vpc_cidr, 1, 1), 7, i + local.aws_availability_zones_count)
  ]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = merge({
    "kubernetes.io/role/elb" = "1",
  },
    module.context.tags,
    var.public_subnet_tags
  )

  private_subnet_tags = merge({
    "kubernetes.io/role/internal-elb" = "1"
  },
    module.context.tags,
    var.private_subnet_tags
  )

  tags = module.context.tags
}

