locals {
  region_short = replace(var.aws_region, "/-[a-z]+-[0-9]+$/", "")
}

resource "aws_secretsmanager_secret" "this" {
  name        = var.secret_name
  description = var.secret_description
    tags = {
    Name        = "${var.project}-${var.env}-${local.region_short}-secret"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "networking"
    Terraform   = "true"
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = jsonencode(var.secret_values)
}
