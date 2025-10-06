# # Elastic IPs for NATs (keyed by AZ)
# resource "aws_eip" "nat" {
#   for_each = { for k, v in aws_subnet.public : v.availability_zone => k }
#   domain   = "vpc"

#   tags = {
#     Name        = "${var.project}-${var.env}-eip-nat-${each.key}"
#     product     = var.product
#     env = var.env
#     Terraform   = "true"
#   }
# }

# # NAT Gateways per AZ
# resource "aws_nat_gateway" "nat" {
#   for_each = aws_eip.nat

#   allocation_id = each.value.id
#   subnet_id     = aws_subnet.public[each.key].id  # map to subnet in that AZ

#   tags = {
#     Name        = "${var.project}-${var.env}-nat-${each.key}"
#     product     = var.product
#     env = var.env
#     Terraform   = "true"
#   }
# }

# Elastic IPs per AZ
resource "aws_eip" "nat" {
  for_each = { for k, v in var.public_subnet_cidrs : v.az => v }
  domain   = "vpc"

  tags = {
    Name        = "${var.project}-${var.env}-${local.region_short}-eip-${each.key}"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "networking"
    Terraform   = "true"
  }
}

# NAT Gateways per AZ
resource "aws_nat_gateway" "nat" {
  for_each = aws_eip.nat

  allocation_id = each.value.id

  # Find public subnet in same AZ
  subnet_id = [
    for k, v in aws_subnet.public : v.id if v.availability_zone == each.key
  ][0]

  tags = {
    Name        = "${var.project}-${var.env}-${local.region_short}-nat-${each.key}"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "networking"
    Terraform   = "true"
  }
}
