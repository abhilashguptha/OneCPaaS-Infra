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
  aws_region = "eu-west-1"
  instances = [
    {
      name              = "bastion-host"
      ami               = "ami-0df2234174058e0c6"
      instance_type     = "t4g.micro"
      subnet_id         = dependency.networking.outputs.public_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["Jump-Server"]]
      key_name          = "OneCPaaS-prod-eu-Jump-Server"
      root_volume_size  = 20
      tags = { Role = "bastion" }
    },
    {
      name              = "RBM-Applications"
      ami               = "ami-0df2234174058e0c6"
      instance_type     = "t4g.xlarge"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-prod-eu-application-ec2-key"
      root_volume_size  = 100
      tags = { Role = "application" }
    },
    {
      name              = "RBM-Dependencies"
      ami               = "ami-0df2234174058e0c6"
      instance_type     = "t4g.xlarge"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-prod-eu-application-ec2-key"
      root_volume_size  = 100
      tags = { Role = "application" }
    },
    {
      name              = "VBM-Dependencies"
      ami               = "ami-0df2234174058e0c6"
      instance_type     = "t4g.xlarge"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-prod-eu-application-ec2-key"
      root_volume_size  = 100
      tags = { Role = "application" }
    },
    {
      name              = "VBM-Applications"
      ami               = "ami-0df2234174058e0c6"
      instance_type     = "t4g.xlarge"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-prod-eu-application-ec2-key"
      root_volume_size  = 100
      tags = { Role = "application" }
    }
  ]
}
