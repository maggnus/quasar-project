# Terraform EKS Module

Terraform module for AWS EKS cluster deployment

## Usage

```yaml
module "eks" {
  source         = "./.."
  global_id      = 1
  cluster_name   = "quasar-dev"
  cluster_region = "ap-southeast-1"
}

output "eks_outputs" {
  value = module.eks
}
```

## Requirements

| Name                                                                      | Version  |
|---------------------------------------------------------------------------|----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3   |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                   | ~> 5.7.0 |

## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.7.0 |

## Modules

| Name                                                                     | Source                                                              | Version |
|--------------------------------------------------------------------------|---------------------------------------------------------------------|---------|
| <a name="module_context"></a> [context](#module\_context)                | ../../modules/terraform-context                                     | n/a     |
| <a name="module_eks"></a> [eks](#module\_eks)                            | terraform-aws-modules/eks/aws                                       | 19.15.3 |
| <a name="module_irsa-ebs-csi"></a> [irsa-ebs-csi](#module\_irsa-ebs-csi) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 4.7.0   |
| <a name="module_vpc"></a> [vpc](#module\_vpc)                            | ./../terraform-aws-vpc                                              | n/a     |

## Resources

| Name                                                                                                                       | Type        |
|----------------------------------------------------------------------------------------------------------------------------|-------------|
| [aws_eks_addon.ebs-csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon)             | resource    |
| [aws_iam_policy.ebs_csi_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name                                                                              | Description                | Type     | Default  | Required |
|-----------------------------------------------------------------------------------|----------------------------|----------|----------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name)          | EKS Cluster name           | `string` | n/a      |   yes    |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region)    | Cloud provider region name | `string` | n/a      |   yes    |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Default Kubernetes version | `string` | `"1.27"` |    no    |
| <a name="input_global_id"></a> [global\_id](#input\_global\_id)                   | Uniq VPC ID                | `number` | n/a      |   yes    |

## Outputs

| Name                                                                                                                  | Description                                              |
|-----------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint)                                | Endpoint for EKS control plane                           |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name)                                            | Kubernetes Cluster Name                                  |
| <a name="output_cluster_region"></a> [cluster\_region](#output\_cluster\_region)                                      | AWS region                                               |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Security group ids attached to the cluster control plane |
