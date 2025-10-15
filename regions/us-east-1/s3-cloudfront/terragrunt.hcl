include {
  path = find_in_parent_folders()
}


terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/s3-cloudfront"
}

inputs = {
  region       = "us-east-1"
}
