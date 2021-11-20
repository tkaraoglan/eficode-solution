data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "eficode" {
  name        = "my_test"
  description = "Used in the terraform"


  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "karaoglan_node" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.server_ami.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.eficode.id]

  tags = {
    Name = "eficode-openweatherapp}"
  }

  provisioner "file" {
    connection {
      agent       = false
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file(var.private_key_path)
    }
    # path of the source folder which includes terraform and eficode folder
    source      = var.source_of_folder
    destination = "/home/ec2-user"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file(var.private_key_path)

    }
    inline = [
      "chmod +x /home/ec2-user/deploy-ansible-docker-docker-compose.sh",
      "/home/ec2-user/deploy-ansible-docker-docker-compose.sh",
      "sudo ansible-playbook /home/ec2-user/ansible_playbook-aws-install-docker.yml",
    ]
  }
  # provisioner "remote-exec" {
  #
  #   script = "${path.root}/delay.sh"
  #
  # }
  #
  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "rm -f ${path.cwd}/../k3s-mtc_node-*"
  # }
}
