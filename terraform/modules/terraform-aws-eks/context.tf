module "context" {
  source = "../../modules/terraform-context"

  namespace = "k8s"
  global_id = var.global_id
  name      = var.cluster_name
}
