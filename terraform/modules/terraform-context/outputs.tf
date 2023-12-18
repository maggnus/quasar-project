# Output variable definitions

output "id" {
  description = "Context ID"
  value       = module.context.id
}

output "tags" {
  value = merge(
    {
      "tag_global_id" : var.global_id,
      "tag_namespace" : var.namespace,
      "tag_name" : var.name,
    },
    var.tags,
  )
}
