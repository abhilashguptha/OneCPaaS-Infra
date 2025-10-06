locals {
  region_short = replace(var.aws_region, "/-[a-z]+-[0-9]+$/", "")
}


resource "aws_lb" "this" {
  name               = "${var.project}-${var.env}-${local.region_short}-internal-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = merge(
    {
      Name        = "${var.project}-${var.env}-internal-alb"
      Project     = var.project
      Environment = var.env
      Terraform   = "true"
    },
    var.tags
  )
}