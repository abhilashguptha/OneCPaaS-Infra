resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.project}-${var.env}-redis-subnet-group"
  subnet_ids = var.subnet_ids
  description = "Subnet group for ${var.project}-${var.env} Redis cluster"
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = var.cluster_name
  description                   = var.description
  engine                        = "redis"
  engine_version                = var.engine_version
  node_type                     = var.node_type
  num_node_groups               = 1
  replicas_per_node_group       = var.replicas_per_node_group
  port                          = var.port
  parameter_group_name          = "default.redis7"
  automatic_failover_enabled    = var.automatic_failover_enabled
  multi_az_enabled              = var.multi_az_enabled
  kms_key_id                    = null
  auth_token                    = var.auth_token
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window
  maintenance_window            = var.maintenance_window
  apply_immediately             = var.apply_immediately
  subnet_group_name             = aws_elasticache_subnet_group.redis.name
  security_group_ids            = var.security_group_ids

  tags = merge({
    Name = "${var.project}-${var.env}-redis"
  }, var.tags)
}

