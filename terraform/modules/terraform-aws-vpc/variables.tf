variable "global_id" {
  description = "Uniq VPC ID"
  type        = number
  validation {
    condition     = var.global_id >= 1 && var.global_id <= 254
    error_message = "The VPC ID must be a number between 1 and 254."
  }
}

variable "vpc_name" {
  description = "AWS VPC name"
  type        = string
}

variable "vpc_region" {
  description = "AWS VPC region"
  type        = string
}

variable "public_subnet_tags" {
  description = "Public subnet tags"
  type        = object({})
  default     = {}
}

variable "private_subnet_tags" {
  description = "Private subnet tags"
  type        = object({})
  default     = {}

}