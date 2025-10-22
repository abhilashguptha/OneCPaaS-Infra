locals {
  region_short = replace(var.aws_region, "/-[a-z]+-[0-9]+$/", "")
}


resource "aws_lb" "this" {
  name             = "${var.project}-${var.env}-${local.region_short}-${var.alb_type}-alb"
  internal           = var.alb_type == "internal" ? true : false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = merge(
    {
        Name        = "${var.project}-${var.env}-${local.region_short}-${var.alb_type}-alb"
        product     = var.product
        env = var.env
        owner       = "devops"
        function    = "Networking"
    },
    var.tags
  )
}