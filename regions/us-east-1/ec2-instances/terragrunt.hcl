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
      ami               = "ami-089f6a79b0e02648a"
      instance_type     = "t4g.micro"
      subnet_id         = dependency.networking.outputs.public_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["Jump-Server"]]
      key_name          = "OneCPaaS-Jump-Server"
      root_volume_size  = 20
      tags = { Role = "bastion" }
    },
    {
      name              = "RBM-Applications"
      ami               = "ami-089f6a79b0e02648a"
      instance_type     = "t4g.xlarge"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-application-ec2"
      root_volume_size  = 100
      tags = { Role = "application" }
    },
    {
      name              = "RBM-Dependencies"
      ami               = "ami-089f6a79b0e02648a"
      instance_type     = "t4g.xlarge"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-application-ec2"
      root_volume_size  = 100
      tags = { Role = "application" }
    },
    {
      name              = "WBM-Dependencies"
      ami               = "ami-089f6a79b0e02648a"
      instance_type     = "t4g.xlarge"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-application-ec2"
      root_volume_size  = 100
      tags = { Role = "application" }
    },
    {
      name              = "WBM-Applications"
      ami               = "ami-089f6a79b0e02648a"
      instance_type     = "t4g.xlarge"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-application-ec2"
      root_volume_size  = 100
      tags = { Role = "application" }
    },
    {
      name              = "Grafana-Dashboard"
      ami               = "ami-089f6a79b0e02648a"
      instance_type     = "t4g.medium"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-application-ec2"
      root_volume_size  = 50
      tags = { Role = "application" }
    },
    {
      name              = "Nginx"
      ami               = "ami-089f6a79b0e02648a"
      instance_type     = "t4g.large"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-application-ec2"
      root_volume_size  = 50
      tags = { Role = "application" }
    },
    {
      name              = "Support-Panel"
      ami               = "ami-089f6a79b0e02648a"
      instance_type     = "t4g.large"
      subnet_id         = dependency.networking.outputs.private_subnet_ids[0]
      security_group_ids = [dependency.security_groups.outputs.security_group_ids["application"]]
      key_name          = "OneCPaaS-application-ec2"
      root_volume_size  = 80
      tags = { Role = "application" }
    }
  ]
}
