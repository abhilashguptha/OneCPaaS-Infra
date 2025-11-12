include {
  path = find_in_parent_folders()
}

dependency "networking" {
  config_path  = "../networking"
}

dependency "security_groups" {
  config_path = "../security-groups"
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/redis"
}
inputs = {
  project      = "onecpaas"
  env          = "prod"
  cluster_name = "onecpaas-prod-us-redis"
  description  = "One CPaaS Redis OSS ElastiCache"

  subnet_ids          = ["subnet-09ba138777c03620a", "subnet-0d89f932de4051b0c", "subnet-043f1c59dc5d7a88f"]
  security_group_ids = [dependency.security_groups.outputs.security_group_ids["redis"]]

  node_type       = "cache.r6g.xlarge"
  engine_version  = "7.1"
  replicas_per_node_group = 1
  automatic_failover_enabled = true
  multi_az_enabled           = true

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true

  snapshot_retention_limit = 3
  snapshot_window          = "05:00-06:00"
  maintenance_window       = "sun:07:00-sun:08:00"
  apply_immediately        = true

  auth_token          = "a5WauDMxgwFtYeCe"

  tags = {
    env      = "prod"
    product  = "cpaas"
    region   = "us"
    owner    = "devops"
    function = "cache"
  }
}