# Terraform Context Module

Terraform module for generate standardized context variables and resource tags.

## Usage

```yaml
module "context" {
  source    = "./.."
  global_id = 1
  namespace = "vpc"
  name      = "my-env"
}

output "context_outputs" {
  value = module.context
}
```

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name                                                      | Source                | Version |
|-----------------------------------------------------------|-----------------------|---------|
| <a name="module_context"></a> [context](#module\_context) | cloudposse/label/null | 0.25.0  |

## Resources

No resources.

## Inputs

| Name                                                            | Description                                                                     | Type         | Default | Required |
|-----------------------------------------------------------------|---------------------------------------------------------------------------------|--------------|---------|:--------:|
| <a name="input_global_id"></a> [global\_id](#input\_global\_id) | Uniq VPC ID                                                                     | `number`     | n/a     |   yes    |
| <a name="input_name"></a> [name](#input\_name)                  | Entity name.                                                                    | `string`     | n/a     |   yes    |
| <a name="input_namespace"></a> [namespace](#input\_namespace)   | Context namespace. Usually it's the name of the resource group (vpc, k8s, etc.) | `string`     | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input\_tags)                  | Extra tags                                                                      | `object({})` | `{}`    |    no    |

## Outputs

| Name                                             | Description |
|--------------------------------------------------|-------------|
| <a name="output_id"></a> [id](#output\_id)       | Context ID  |
| <a name="output_tags"></a> [tags](#output\_tags) | n/a         |
