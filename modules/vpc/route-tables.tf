# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block     = "10.200.0.0/16"
    transit_gateway_id = "tgw-067754bf3d2ad1b02"
  }

  route {
    cidr_block     = "10.222.0.0/16"
    transit_gateway_id = "tgw-067754bf3d2ad1b02"
  }

  route {
    cidr_block     = "10.6.0.0/16"
    transit_gateway_id = "tgw-067754bf3d2ad1b02"
  }

  route {
    cidr_block     = "10.2.0.0/16"
    transit_gateway_id = "tgw-067754bf3d2ad1b02"
  }
  tags = {
    Name = "${var.project}-${var.env}-${local.region_short}-public-rt"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "networking"
    Terraform   = "true"
  }
}

# Associate all public subnets with the public RT
resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

# Private Route Tables per AZ
resource "aws_route_table" "private" {
  for_each = aws_nat_gateway.nat

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = each.value.id
  }

  dynamic "route" {
    for_each = var.tgw_id != null ? var.tgw_cidrs : []
    content {
      cidr_block         = route.value
      transit_gateway_id = var.tgw_id
    }
  }

  tags = {
    Name = "${var.project}-${var.env}-${local.region_short}-private-rt-${each.key}"
    product     = var.product
    env = var.env
    owner       = "devops"
    function    = "networking"
    Terraform   = "true"
  }
}

# Associate private subnets with their AZ-specific private RT
resource "aws_route_table_association" "private_assoc" {
  for_each = {
    for name, subnet in aws_subnet.private : name => subnet
  }

  subnet_id      = each.value.id
  # Pick private RT for the same AZ
  route_table_id = aws_route_table.private[each.value.availability_zone].id
}