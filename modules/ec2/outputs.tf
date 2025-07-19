output "instance_ids" {
  description = "List of EC2 instance IDs"
  value       = aws_instance.this[*].id
}

output "private_ips" {
  description = "Private IPs of EC2 instances"
  value       = aws_instance.this[*].private_ip
}
