output "instance_ip" {
  value     = aws_instance.karaoglan_node.public_ip
  sensitive = true
}
