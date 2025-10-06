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
  aws_region = "eu-west-1"
  security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
  subnet_ids         = ["subnet-04f98f8ca319556a5", "subnet-0bf89d4ee7aa21e15", "subnet-01ecc843242c3794c"]
}