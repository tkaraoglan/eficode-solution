variable "aws_region" {
  default = "us-east-1"
}
variable "private_key_path" {
  default = "~/.ssh/ids_rsa"
}
variable "key_name" {
  default = "ids_rsa"
}

variable "source_of_folder" {
  default = "~/terraform-ansible"
}
