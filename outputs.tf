output "server_public_ip" {
  description = "Public IPs of the servers"
  value       = [for i in aws_instance.server : i.public_ip]

}

output "server_private_ip" {
  description = "Private IPs of the Servers"
  value       = [for i in aws_instance.server : i.private_ip]
}
