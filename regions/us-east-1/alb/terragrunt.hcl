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
  source = "${replace(get_repo_root(), "\\", "/")}/modules/alb"
}


inputs = {
  project            = "myproject"
  env                = "stg"
  security_group_ids = [dependency.security_groups.outputs.security_group_ids["web"]]
  subnet_ids         = ["subnet-020b8e4bc018922c2", "subnet-035ce5d620bfb8084", "subnet-03eb58f7325e6abdb"]
}
