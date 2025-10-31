include {
  path = find_in_parent_folders()
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/iam/cloudwatch-read-only-role"
}


dependency "cloudwatch_user" {
  config_path = "../user"
}

inputs = {
  role_name             = "CloudWatchReadOnlyRole"
  trusted_principal_arn = dependency.cloudwatch_user.outputs.user_arn
}
