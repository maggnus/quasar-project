module "context" {
  source = "../../modules/terraform-context"

  namespace = "eks"
  global_id = var.global_id
  name      = var.cluster_name
}
