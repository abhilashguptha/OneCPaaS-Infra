
# Public Subnets
resource "aws_subnet" "public" {
  for_each = var.public_subnet_cidrs

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project}-${var.env}-${local.region_short}-${each.key}"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "networking"
    Terraform   = "true"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  for_each = var.private_subnet_cidrs

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name        = "${var.project}-${var.env}-${local.region_short}-${each.key}"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "networking"
    Terraform   = "true"
  }
}
