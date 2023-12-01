output "server1_public_ip" {
  description = "Public IP of the Server 1"
  value       = aws_instance.server_1.public_ip
}

output "server2_public_ip" {
  description = "Public IP of the Server 2"
  value       = aws_instance.server_2.public_ip
}

output "server1_private_ip" {
  description = "Private IP of the Server 1"
  value       = aws_instance.server_1.private_ip
}

output "server2_private_ip" {
  description = "Private IP of the Server 2"
  value       = aws_instance.server_2.private_ip
}