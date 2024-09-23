# resource "aws_instance" "linux" {
#   ami           = "ami-03e383d33727f4804"
#   instance_type = "t2.medium"

#   key_name = "aws-keypair"
#   vpc_security_group_ids = [aws_security_group.debian_sg.id]
#   tags = {
#     Name = "debian"
#     Environment = "test"
#   }
# }

# resource "aws_instance" "windows" {
#   ami           = "ami-0845068028e672a07"
#   instance_type = "t2.medium"

#   key_name = "aws-keypair"
#   vpc_security_group_ids = [aws_security_group.debian_sg.id]
#   tags = {
#     Name = "windows"
#     Environment = "qa"
#   }
# }

resource "aws_instance" "centos" {
  ami           = "ami-0a7e20852fffed294"
  instance_type = "t2.medium"

  key_name = "aws-keypair"
  vpc_security_group_ids = [aws_security_group.debian_sg.id]
  tags = {
    Name = "centos"
    Environment = "test"
  }
}

resource "aws_security_group" "debian_sg" {
  name = "debian-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9990
    to_port     = 9990
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}