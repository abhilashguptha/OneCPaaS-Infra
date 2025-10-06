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
  aws_region = "us-east-1"
  security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
  subnet_ids         = ["subnet-0659f62e162c21478", "subnet-04e6b6a591da425cc", "subnet-0eda37b5985d12379"]
}