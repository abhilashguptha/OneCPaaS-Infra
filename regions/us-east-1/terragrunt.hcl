remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform1-state-file-aps1"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true

    # Key = account-id/region/path_to_module/terraform.tfstate
    # key =  "${get_aws_account_id()}/${get_env("AWS_REGION")}/${path_relative_to_include()}/terraform.tfstate"
    key = "${get_aws_account_id()}/${path_relative_to_include()}/terraform.tfstate"
  }
}
