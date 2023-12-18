module "context" {
  source    = "./.."
  global_id = 1
  namespace = "vpc"
  name      = "my-env"
}

output "context_outputs" {
  value = module.context
}

