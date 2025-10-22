variable "cluster_identifier" {
  type        = string
  description = "Aurora cluster identifier"
}

variable "engine" {
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_version" {
  type        = string
}

variable "instance_class" {
  type        = string
}

variable "replica_count" {
  type        = number
  default     = 1
  description = "Number of reader instances (excluding the writer)"
}

variable "master_username" {
  type        = string
  description = "Master username for the cluster"
}

variable "master_password" {
  type        = string
  description = "Master password for the cluster (recommend using Secrets Manager)"
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet ids across at least two AZs"
  validation {
    condition     = length(distinct(var.subnet_ids)) >= 2
    error_message = "At least two distinct subnet IDs (in different AZs) are required for Aurora multi-AZ."
  }
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group ids for the cluster instances"
}

variable "backup_retention_period" {
  type    = number
  default = 7
}

variable "preferred_backup_window" {
  type    = string
  default = "03:00-04:00"
}

variable "kms_key_id" {
  type    = string
  default = null
  description = "(optional) KMS key for storage encryption"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "product" {
  description = "product name"
  type        = string
  default     = "cpaas"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "one-cpaas"
}
variable "env" {
  description = "env (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "monitoring_role_arn" {
  description = "IAM Role ARN for Enhanced Monitoring (RDS needs this)"
  type        = string
  default     = null
}
