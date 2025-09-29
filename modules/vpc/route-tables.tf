# # Public Route Table
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name        = "${var.project}-${var.env}-public-rt"
#     Project     = var.project
#     Environment = var.env
#     Terraform   = "true"
#   }
# }

# # Associate all public subnets
# resource "aws_route_table_association" "public_assoc" {
#   for_each       = aws_subnet.public
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.public.id
# }



# # Private Route Table per AZ (pointing to NAT of that AZ)
# resource "aws_route_table" "private" {
#   for_each = aws_nat_gateway.nat
#   vpc_id   = aws_vpc.main.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = each.value.id
#   }

#   tags = {
#     Name        = "${var.project}-${var.env}-private-rt-${each.key}"
#     Project     = var.project
#     Environment = var.env
#     Terraform   = "true"
#   }
# }

# # Associate each private subnet with its AZ’s route table
# resource "aws_route_table_association" "private_assoc" {
#   for_each = aws_subnet.private

#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.private[each.value.availability_zone].id
# }


# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project}-${var.env}-${local.region_short}-public-rt"
    Project     = var.project
    Environment = var.env
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

  tags = {
    Name = "${var.project}-${var.env}-${local.region_short}-private-rt-${each.key}"
    Project     = var.project
    Environment = var.env
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