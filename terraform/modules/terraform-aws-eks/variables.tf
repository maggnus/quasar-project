variable "global_id" {
  description = "Uniq VPC ID"
  type        = number
  validation {
    condition     = var.global_id >= 1 && var.global_id <= 254
    error_message = "The VPC ID must be a number between 1 and 254."
  }
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Default Kubernetes version"
  type        = string
  default     = "1.27"
}

variable "cluster_region" {
  description = "Cloud provider region name"
  type        = string
}
