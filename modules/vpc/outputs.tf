output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = values(aws_subnet.public)[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = values(aws_subnet.private)[*].id
}

output "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  value       = values(aws_subnet.public)[*].cidr_block
}

output "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  value       = values(aws_subnet.private)[*].cidr_block
}


output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.nat[*].id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_ids" {
  value = aws_route_table.private[*].id
}
