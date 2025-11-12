variable "project" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "cluster_name" {
  description = "Name for the ElastiCache Redis cluster"
  type        = string
}

variable "description" {
  description = "Description for the Redis ElastiCache"
  type        = string
  default     = "One CPaaS Redis ElastiCache"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ElastiCache subnet group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the cluster"
  type        = list(string)
}

variable "node_type" {
  description = "Instance type for Redis nodes"
  type        = string
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
}



variable "automatic_failover_enabled" {
  description = "Enable automatic failover between primary and replicas"
  type        = bool
  default     = true
}

variable "multi_az_enabled" {
  description = "Enable Multi-AZ for high availability"
  type        = bool
  default     = true
}

variable "at_rest_encryption_enabled" {
  description = "Enable encryption at rest"
  type        = bool
  default     = true
}

variable "transit_encryption_enabled" {
  description = "Enable encryption in transit (TLS)"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "Weekly time range for maintenance (UTC)"
  type        = string
  default     = "sun:07:00-sun:08:00"
}

variable "snapshot_retention_limit" {
  description = "Number of days to retain automatic snapshots (0 to disable)"
  type        = number
  default     = 3
}

variable "snapshot_window" {
  description = "Time window for taking daily snapshots"
  type        = string
  default     = "05:00-06:00"
}

variable "port" {
  description = "Redis port"
  type        = number
  default     = 6379
}

variable "apply_immediately" {
  description = "Whether modifications are applied immediately"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "replicas_per_node_group" {
  description = "Number of replicas per node group (1 = 2 nodes total)"
  type        = number
}

variable "auth_token" {
  description = "AUTH token for Redis AUTH (must be 16-128 chars)"
  type        = string
  sensitive   = true
}