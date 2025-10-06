locals {
  aws_region = "eu-west-1"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "onecpaas-terraform-remote-state-eu"
    region = local.aws_region
    encrypt        = true
    use_lockfile = true

    # Key = account-id/region/path_to_module/terraform.tfstate
    # key =  "${get_aws_account_id()}/${get_env("AWS_REGION")}/${path_relative_to_include()}/terraform.tfstate"
    key = "${get_aws_account_id()}/${local.aws_region}/${path_relative_to_include()}/terraform.tfstate"
  }
}


generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}