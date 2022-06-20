provider "aws" {
}

resource "aws_instance" "ub_ddos1" {
  ami = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  tags = {
    Environment = "ub"
    Name        = "nginx"
  }
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data = file("./script/nginx.sh")
  key_name= "iiva5897"
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "server test dd"
#  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


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
    Name = "web-tag"
  }
}




