locals {
  region_short = replace(var.aws_region, "/-[a-z]+-[0-9]+$/", "")
}

resource "aws_instance" "this" {
  for_each = { for inst in var.instances : inst.name => inst }

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet_id
  vpc_security_group_ids = each.value.security_group_ids
  key_name      = each.value.key_name

  associate_public_ip_address = each.key == "bastion-host" ? true : false

  root_block_device {
    volume_size = each.value.root_volume_size
  }

  tags = merge(
    {
    Name        = "${var.project}-${var.env}-${local.region_short}-${each.value.name}"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "applications"
    Terraform   = "true"
    },
    each.value.tags
  )
}
