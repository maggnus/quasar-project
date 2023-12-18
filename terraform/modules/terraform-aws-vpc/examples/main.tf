module "vpc" {
  source     = "./.."
  global_id  = 1
  vpc_name   = "vpc-test"
  vpc_region = "ap-southeast-1"
}

output "vpc_outputs" {
  value = module.vpc
}
