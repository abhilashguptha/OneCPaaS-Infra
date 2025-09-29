variable "aws_region" {
    type    = string
    default = "ap-south-1"
}
  
variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
  default     = ""
}

variable "project" {
  type = string
  default     = "One-CPaaS"
}

variable "env" {
  description = "Environment (e.g., dev, prod)"
  type        = string
  default     = "Prod"
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

