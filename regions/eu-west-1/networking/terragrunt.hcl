include {
  path = find_in_parent_folders()
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/vpc"
}

inputs = {
  aws_region = "ap-south-1"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_subnet_cidrs = {
    "Public-subnet-1a" = { cidr = "10.0.1.0/24", az = "ap-south-1a" }
    "Public-subnet-1b" = { cidr = "10.0.2.0/24", az = "ap-south-1b" }
    "Public-subnet-1c" = { cidr = "10.0.3.0/24", az = "ap-south-1c" }
  }

  private_subnet_cidrs = {
    "App-Private-Subnet-1a" = { cidr = "10.0.101.0/24", az = "ap-south-1a" }
    "DB-Private-Subnet-1a"  = { cidr = "10.0.102.0/24", az = "ap-south-1a" }

    "App-Private-Subnet-1b" = { cidr = "10.0.103.0/24", az = "ap-south-1b" }
    "DB-Private-Subnet-1b"  = { cidr = "10.0.104.0/24", az = "ap-south-1b" }

    "App-Private-Subnet-1c" = { cidr = "10.0.105.0/24", az = "ap-south-1c" }
    "DB-Private-Subnet-1c"  = { cidr = "10.0.106.0/24", az = "ap-south-1c" }
  }
}


