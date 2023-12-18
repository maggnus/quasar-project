module "eks" {
  source         = "../../modules/terraform-aws-eks"
  global_id      = 1
  cluster_name   = "quasar-dev"
  cluster_region = "ap-southeast-1"
}

output "eks_output" {
  value = module.eks
}