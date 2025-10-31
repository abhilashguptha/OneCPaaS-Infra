include {
  path = find_in_parent_folders()
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/iam/users"
}


inputs = {
  user_name  = "cloudwatch-reader-user"
}
