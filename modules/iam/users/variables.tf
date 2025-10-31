variable "user_name" {
  description = "IAM user name"
  type        = string
}

variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "role_arn" {
  description = "ARN of role user can assume"
  type        = string
}
