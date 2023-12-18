module "context" {
  source = "../../modules/terraform-context"

  namespace = "vpc"
  global_id = var.global_id
  name      = var.vpc_name
}
