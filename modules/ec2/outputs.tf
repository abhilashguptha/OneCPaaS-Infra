output "instance_ids" {
  value = { for name, inst in aws_instance.this : name => inst.id }
}

output "private_ips" {
  value = { for name, inst in aws_instance.this : name => inst.private_ip }
}

output "public_ips" {
  value = { for name, inst in aws_instance.this : name => inst.public_ip }
}
