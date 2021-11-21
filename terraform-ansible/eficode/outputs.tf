# output "instances" {
#   value = {for i in module.compute.instance : i.tags.Name =>  "${i.public_ip}:8000"}
#
# }

output "instance_ip_port" {
  value = nonsensitive(join(":", [module.compute.instance_ip, 8000]))
}
