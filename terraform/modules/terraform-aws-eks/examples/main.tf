module "eks" {
  source         = "./.."
  global_id      = 1
  cluster_name   = "quasar-dev"
  cluster_region = "ap-southeast-1"
}

output "eks_outputs" {
  value = module.eks
}
