# Subnet group for the cluster
resource "aws_db_subnet_group" "this" {
  name       = "${var.project}-${var.env}-${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(var.tags, { Name = "${var.project}-${var.env}-${var.cluster_identifier}-subnet-group" })
}

# Optionally encrypt storage if KMS key provided
locals {
  storage_encrypted = var.kms_key_id != null ? true : false
}

# The Aurora cluster
resource "aws_rds_cluster" "this" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  database_name           = null
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = var.security_group_ids
  skip_final_snapshot     = true
  deletion_protection     = false
  storage_type            = "aurora-iopt1"

  # Encryption
  storage_encrypted       = true
  kms_key_id              = null


  tags = var.tags
}

# Writer instance (single)
resource "aws_rds_cluster_instance" "writer" {
  identifier              = "${var.cluster_identifier}-writer"
  cluster_identifier      = aws_rds_cluster.this.id
  instance_class          = var.instance_class
  engine                  = var.engine
  engine_version          = var.engine_version
  publicly_accessible     = false
  apply_immediately       = true
  db_subnet_group_name    = aws_db_subnet_group.this.name

  promotion_tier          = 1

  # Performance Insights
  performance_insights_enabled          = true
  performance_insights_retention_period = 7

  # Enhanced Monitoring
  monitoring_interval     = 60
  monitoring_role_arn     = var.monitoring_role_arn

  tags = merge(var.tags, { Role = "writer" })
}

# Reader instances (count = replica_count)
resource "aws_rds_cluster_instance" "readers" {
  count                   = var.replica_count
  identifier              = "${var.cluster_identifier}-reader-${count.index + 1}"
  cluster_identifier      = aws_rds_cluster.this.id
  instance_class          = var.instance_class
  engine                  = var.engine
  engine_version          = var.engine_version
  publicly_accessible     = false
  apply_immediately       = true
  db_subnet_group_name    = aws_db_subnet_group.this.name

  # Failover priority (higher = lower priority)
  promotion_tier          = count.index + 2

  performance_insights_enabled          = true
  performance_insights_retention_period = 7

  monitoring_interval     = 60
  monitoring_role_arn     = var.monitoring_role_arn

  tags = merge(var.tags, { Role = "reader" })
}
