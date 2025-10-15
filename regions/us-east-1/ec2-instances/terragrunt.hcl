include {
  path = find_in_parent_folders()
}

dependency "networking" {
  config_path  = "../networking"
}

dependency "security_groups" {
  config_path = "../security-groups"
}

terraform {
  source = "${replace(get_repo_root(), "\\", "/")}/modules/ec2"
}

# Multiple instances defined here
inputs = {
  aws_region = "us-east-1"
  instances = [
    {
      name              = "bastion-host"
      ami               = "ami-0f5d42f0ba3ba0328"
      instance_type     = "t4g.micro"
      subnet_id         = dependency.networking.outputs.public_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["web"]]
      key_name          = "jump-server-keypair"
      root_volume_size  = 10
      tags = { Role = "bastion" }
    },
    {
      name              = "app1"
      ami               = "ami-0f5d42f0ba3ba0328"
      instance_type     = "t4g.micro"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["web"]]
      key_name          = "private-instance"
      root_volume_size  = 20
      tags = { Role = "application" }
    }
  ]
}
