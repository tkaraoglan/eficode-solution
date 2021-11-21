data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}


# Our default security group to access
# the instances over SSH and 8000,80,9000

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
  user_data              = templatefile(var.user_data_path,
    {
      APPID         = var.APPID
      BACKEND_PORT  = var.BACKEND_PORT
      MAP_ENDPOINT  = var.MAP_ENDPOINT
      TARGET_CITY   = var.TARGET_CITY
      FRONTEND_HOST = var.FRONTEND_HOST
      FRONTEND_PORT = var.FRONTEND_PORT
    }
  )
  tags = {
    Name = "eficode-openweatherapp"
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

    script = "${path.root}/delay.sh"

  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file(var.private_key_path)

    }
    inline = [

      "sudo ansible-playbook /home/ec2-user/ansible_playbook-aws-install-docker.yml",
    ]
  }
}
