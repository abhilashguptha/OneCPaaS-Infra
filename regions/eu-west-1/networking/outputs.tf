output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_ids" {
  description = "IDs of all public subnets"
  value       = values(aws_subnet.public)[*].id
}

output "private_subnet_ids" {
  description = "IDs of all private subnets"
  value       = values(aws_subnet.private)[*].id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_ids" {
  description = "IDs of the NAT Gateways"
  value       = [for n in aws_nat_gateway.nat : n.id]
}