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

variable "tgw_id" {
  type      = string
  default   = null
  description = "Transit Gateway ID to attach private routes to (optional)"
}

variable "tgw_cidrs" {
  type      = list(string)
  default   = []
  description = "CIDR blocks to route via Transit Gateway (optional)"
}