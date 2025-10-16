variable "secret_name" {
  type        = string
  description = "Name of the secret"
}

variable "secret_description" {
  type        = string
  default     = "Managed by Terraform"
}

variable "secret_values" {
  type        = map(string)
  description = "Key/value pairs to store in the secret"
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "product" {
  description = "product name"
  type        = string
  default     = "cpaas"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "One-CPaaS"
}
variable "env" {
  description = "env (e.g., dev, prod)"
}