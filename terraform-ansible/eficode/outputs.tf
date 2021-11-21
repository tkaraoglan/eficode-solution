output "instance_ip_port" {
  value = nonsensitive(join(":", [module.compute.instance_ip, 8000]))
}
