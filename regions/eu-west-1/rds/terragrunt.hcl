include {
  path = find_in_parent_folders()
}

dependency "networking" {
  config_path  = "../networking"
}

dependency "security_groups" {
  config_path = "../security-groups"
}

dependency "iam" {
  config_path = "../iam/rds-monitoring-role"
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/rds"
}


inputs = {
  cluster_identifier  = "my-app-aurora"
  engine_version      = "13.20"
  instance_class      = "db.r5.large"
  replica_count       = 2

  master_username     = "dbadmin"
  # For production, read this from Secrets Manager or environment securely
  master_password     = "StrongPassw0rd!"

  # Subnets pulled from your VPC module
  #subnet_ids          = ["subnet-0088847a7f084d85e", "subnet-0f4586e357d24dc80", "subnet-0fa23e9516e50b845"]
  subnet_ids          = ["subnet-09ba138777c03620a", "subnet-0d89f932de4051b0c", "subnet-043f1c59dc5d7a88f"]

  # Pull a list of SGs — here we pick the map key "rds" and wrap in list
  # Update "rds" to match your key in security_group_ids map if different
  security_group_ids  = [dependency.security_groups.outputs.security_group_ids["db"]]

  backup_retention_period = 7
  preferred_backup_window = "03:00-04:00"


  # Required for Enhanced Monitoring
  monitoring_role_arn = dependency.iam.outputs.monitoring_role_arn


  tags = {
    Environment = "dev"
    Project     = "example"
  }
}
