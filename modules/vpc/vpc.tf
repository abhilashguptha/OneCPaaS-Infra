locals {
  region_short = replace(var.aws_region, "/-[a-z]+-[0-9]+$/", "")
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.product}-${var.env}-${local.region_short}-vpc"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "networking"
    Terraform   = "true"
  }
}
