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

variable "env" {
  description = "env (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = []
}

variable "azs_suffix" {
  description = "Suffix list for subnets"
  type        = list(string)
  default     = ["1a", "1b"]
}

variable "public_subnet_cidrs" {
  description = "Map of public subnets with cidr and az"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnet_cidrs" {
  description = "Map of private subnets with cidr and az"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "public_subnet_name" {
  description = "Base name for public subnets"
  type        = string
  default     = ""
}

variable "private_subnet_name" {
  description = "Base name for private subnets"
  type        = string
  default     = ""
}

