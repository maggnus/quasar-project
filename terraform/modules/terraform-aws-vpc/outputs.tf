# Output variable definitions

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = local.vpc_cidr
}

output "vpc_public_subnets" {
  description = "CIDR blocks of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "vpc_private_subnets" {
  description = "CIDR blocks of the VPC's private subnets"
  value       = module.vpc.private_subnets
}

output "vpc_availability_zones" {
  value = local.aws_availability_zones_names
}