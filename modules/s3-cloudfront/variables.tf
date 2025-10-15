# s3_cloudfront module variables.tf
variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
  default     = "One-CPaaS"
}

variable "env" {
  description = "Environment name (dev, stage, prod)"
  type        = string
  default = "prod"
}

variable "product" {
  description = "product name"
  type        = string
  default     = "cpaas"
}

