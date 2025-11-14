provider "aws" {
  region = var.region
}

resource "aws_instance" "web_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.ssh_key_name

  tags = {
    Name = "nginx-server"
  }
}
