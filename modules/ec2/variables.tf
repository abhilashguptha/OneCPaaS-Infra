variable "instances" {
  description = "List of EC2 instance configurations"
  type = list(object({
    name              = string
    ami               = string
    instance_type     = string
    subnet_id         = string
    security_group_ids = list(string)
    key_name          = string
    root_volume_size  = number
    tags              = map(string)
  }))
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "One-CPaaS"
}

variable "env" {
  description = "Environment (e.g., dev, prod)"
  type        = string
  default     = "Prod"
}

