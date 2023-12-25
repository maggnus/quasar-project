# Terraform EKS Module

Terraform module for AWS EKS cluster deployment

## Usage

```yaml
module "vpc" {
  source     = "./.."
  global_id  = 1
  vpc_name   = "vpc-test"
  vpc_region = "ap-southeast-1"
}

output "vpc_outputs" {
  value = module.vpc
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

| Name                                                      | Source                          | Version |
|-----------------------------------------------------------|---------------------------------|---------|
| <a name="module_context"></a> [context](#module\_context) | ../../modules/terraform-context | n/a     |
| <a name="module_vpc"></a> [vpc](#module\_vpc)             | terraform-aws-modules/vpc/aws   | 5.0.0   |

## Resources

| Name                                                                                                                             | Type        |
|----------------------------------------------------------------------------------------------------------------------------------|-------------|
| [aws_availability_zones.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name                                                                                            | Description         | Type         | Default | Required |
|-------------------------------------------------------------------------------------------------|---------------------|--------------|---------|:--------:|
| <a name="input_global_id"></a> [global\_id](#input\_global\_id)                                 | Uniq VPC ID         | `number`     | n/a     |   yes    |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | Private subnet tags | `object({})` | `{}`    |    no    |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags)    | Public subnet tags  | `object({})` | `{}`    |    no    |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name)                                    | AWS VPC name        | `string`     | n/a     |   yes    |
| <a name="input_vpc_region"></a> [vpc\_region](#input\_vpc\_region)                              | AWS VPC region      | `string`     | n/a     |   yes    |

## Outputs

| Name                                                                                                       | Description                              |
|------------------------------------------------------------------------------------------------------------|------------------------------------------|
| <a name="output_vpc_availability_zones"></a> [vpc\_availability\_zones](#output\_vpc\_availability\_zones) | n/a                                      |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr)                                             | VPC CIDR block                           |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id)                                                   | VPC ID                                   |
| <a name="output_vpc_private_subnets"></a> [vpc\_private\_subnets](#output\_vpc\_private\_subnets)          | CIDR blocks of the VPC's private subnets |
| <a name="output_vpc_public_subnets"></a> [vpc\_public\_subnets](#output\_vpc\_public\_subnets)             | CIDR blocks of the VPC's public subnets  |
