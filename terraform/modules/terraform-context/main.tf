module "context" {
  source  = "cloudposse/label/null"
  version = "0.25.0" # requires Terraform >= 0.13.0

  // Set module variables
  namespace   = var.namespace
  environment = var.global_id
  name        = var.name
}
