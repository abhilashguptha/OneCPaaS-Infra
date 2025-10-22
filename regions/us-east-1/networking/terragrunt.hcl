include {
  path = find_in_parent_folders()
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/vpc"
}

inputs = {
  aws_region = "us-east-1"
  vpc_cidr        = "172.17.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidrs = {
    "Public-subnet-1a" = { cidr = "172.17.24.0/25", az = "us-east-1a" }
    "Public-subnet-1b" = { cidr = "172.17.24.128/25", az = "us-east-1b" }
    "Public-subnet-1c" = { cidr = "172.17.25.0/25", az = "us-east-1c" }
  }

  private_subnet_cidrs = {
    "App-Private-Subnet-1a" = { cidr = "172.17.0.0/21", az = "us-east-1a" }
    "DB-Private-Subnet-1a"  = { cidr = "172.17.26.0/24", az = "us-east-1a" }

    "App-Private-Subnet-1b" = { cidr = "172.17.8.0/21", az = "us-east-1b" }
    "DB-Private-Subnet-1b"  = { cidr = "172.17.27.0/24", az = "us-east-1b" }

    "App-Private-Subnet-1c" = { cidr = "172.17.16.0/21", az = "us-east-1c" }
    "DB-Private-Subnet-1c"  = { cidr = "172.17.28.0/24", az = "us-east-1c" }
  }

  tgw_id     = "tgw-067754bf3d2ad1b02"
  tgw_cidrs  = ["10.6.0.0/16", "10.2.0.0/16", "10.222.0.0/16", "10.200.0.0/16", "10.192.32.67/32"]
}


