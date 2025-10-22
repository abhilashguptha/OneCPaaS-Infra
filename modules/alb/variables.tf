variable "name" {
  description = "project name"
  type        = string
}

variable "project" {
  description = "project name"
  type        = string
  default     = "One-CPaaS"
}

variable "product" {
  description = "product name"
  type        = string
  default     = "cpaas"
}

variable "aws_region" {
    type        = string
    description = "Region for the VPC"
    default     = ""
}

variable "env" {
  description = "env (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs for the ALB"
}
variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the ALB"
}
variable "tags" {
  type        = map(string)
  description = "Additional tags to apply"
  default     = {}
}

variable "alb_type" {
  description = "Type of ALB: 'internal' or 'public'"
  type        = string
  default     = "internal"
}