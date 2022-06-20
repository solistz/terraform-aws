
output "instance_public_ip_1" {
 description = "Public IP address of the EC2 instance"
 value       = aws_instance.ub_ddos_dyn[1].public_ip
}


output "instance_public_ip_3" {
 description = "Public IP address of the EC2 instance"
 value       = aws_instance.ub_ddos_dyn[1].public_ip
}

output "instance_public_ip_5" {
 description = "Public IP address of the EC2 instance"
 value       = aws_instance.ub_ddos_dyn[1].public_ip
}
