variable "aws_region" {
    type    = string
    default = ""
}
  
variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
  default     = ""
}

variable "product" {
  type = string
  default     = "cpaas"
}

variable "env" {
  description = "env (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "security_groups" {
  description = "List of security groups with ingress and egress rules"
  type = list(object({
    name        = string
    description = string
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    tags = map(string)
  }))
}

