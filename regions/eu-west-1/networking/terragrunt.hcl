include {
  path = find_in_parent_folders()
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/vpc"
}

inputs = {
  aws_region = "eu-west-1"
  vpc_cidr        = "172.31.0.0/16"
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  public_subnet_cidrs = {
    "Public-subnet-1a" = { cidr = "172.31.24.0/25", az = "eu-west-1a" }
    "Public-subnet-1b" = { cidr = "172.31.24.128/25", az = "eu-west-1b" }
    "Public-subnet-1c" = { cidr = "172.31.25.0/25", az = "eu-west-1c" }
  }

  private_subnet_cidrs = {
    "App-Private-Subnet-1a" = { cidr = "172.31.0.0/21", az = "eu-west-1a" }
    "App-Private-Subnet-1b" = { cidr = "172.31.8.0/21", az = "eu-west-1b" }
    "App-Private-Subnet-1c" = { cidr = "172.31.16.0/21", az = "eu-west-1c" }


    "DB-Private-Subnet-1a"  = { cidr = "172.31.26.0/24", az = "eu-west-1a" }
    "DB-Private-Subnet-1b"  = { cidr = "172.31.27.0/24", az = "eu-west-1b" }
    "DB-Private-Subnet-1c"  = { cidr = "172.31.28.0/24", az = "eu-west-1c" }
  }
}


