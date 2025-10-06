locals {
  default_region = "eu-west-1"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "onecpaas-terraform-remote-state-eu"
    region = local.default_region
    encrypt        = true
    use_lockfile = true

    # Key = account-id/region/path_to_module/terraform.tfstate
    # key =  "${get_aws_account_id()}/${get_env("AWS_REGION")}/${path_relative_to_include()}/terraform.tfstate"
    key = "${get_aws_account_id()}/${local.default_region}/${path_relative_to_include()}/terraform.tfstate"
  }
}
