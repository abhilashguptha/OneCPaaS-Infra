variable "role_name" {
  description = "Name of IAM Role"
  type        = string
}

variable "trusted_principal_arn" {
  description = "ARN of IAM User or Role allowed to assume this role"
  type        = string
}
