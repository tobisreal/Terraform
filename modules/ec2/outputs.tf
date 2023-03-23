output "instance_id" {
  value = aws_instance.nameofinstance.id
}

output "security_group_id" {
  value = aws_security_group.instanceSG.id
}
