module "vpc" {
  source     = "./../terraform-aws-vpc"
  global_id  = var.global_id
  vpc_name   = var.cluster_name
  vpc_region = var.cluster_region

  # required tags to make ALB ingress work https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}
