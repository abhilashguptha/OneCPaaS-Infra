variable "project" {
  type        = string
  description = "Project name"
}

variable "aws_region" {
    type        = string
    description = "Region for the VPC"
    default     = ""
  
}

variable "env" {
  type        = string
  description = "Environment name"
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
