variable "global_id" {
  description = "Uniq VPC ID"
  type        = number
  validation {
    condition     = var.global_id >= 1 && var.global_id <= 254
    error_message = "The VPC ID must be a number between 1 and 254."
  }
}

variable "namespace" {
  description = "Context namespace. Usually it's the name of the resource group (vpc, k8s, etc.)"
  type        = string
}

variable "name" {
  description = "Entity name."
  type        = string
}


variable "tags" {
  description = "Extra tags"
  type        = object({})
  default     = {}
}