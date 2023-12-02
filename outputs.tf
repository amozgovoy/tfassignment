output "server1_public_ip" {
  description = "Public IP of the Server1"
  value       = aws_instance.server1.public_ip
}

output "server2_public_ip" {
  description = "Public IP of the Server2"
  value       = aws_instance.server2.public_ip
}

output "server1_private_ip" {
  description = "Private IP of the Server1"
  value       = aws_instance.server1.public_ip
}

output "server2_private_ip" {
  description = "Private IP of the Server2"
  value       = aws_instance.server2.public_ip
}
