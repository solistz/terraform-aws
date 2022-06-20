output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ub_ddos1.public_ip
}
output "aws_security_group_web" {
  description = "Sec_Gr_WEB"
  value       = aws_security_group.web.ingress
}