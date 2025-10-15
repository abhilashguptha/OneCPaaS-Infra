include {
  path = find_in_parent_folders()
}

dependency "networking" {
  config_path  = "../networking"

}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/security-groups"
}


inputs = {
  aws_region = "eu-west-1"
  vpc_id = dependency.networking.outputs.vpc_id
  security_groups = [
    {
      name        = "application"
      description = "Allow HTTP/HTTPS/SSH"
      ingress_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["172.31.0.0/16"] },
        { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["172.31.0.0/16"] },
        { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["172.31.0.0/16"] }
      ]
      egress_rules = [
        { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
      ]
      tags = {
      }
    },
    {
      name        = "db"
      description = "Allow MySQL only from VPC"
      ingress_rules = [
        { from_port = 3306, to_port = 3306, protocol = "tcp", cidr_blocks = ["172.31.0.0/16"] }
      ]
      egress_rules = [
        { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
      ]
      tags = {
      }
    }
  ]
}

  