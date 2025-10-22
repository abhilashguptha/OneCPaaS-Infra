include {
  path = find_in_parent_folders()
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/iam/rds-monitoring-role"
}

inputs = {
    aws_region = "us-east-1"
    project = "onecpaas"
    env     = "dev"
    tags = {
        evn = "prod"
        Project     = "example"
        product     = "onecpaas"
        owner       = "devops"
        function    = "authentication"
    }
}
