#VPC
resource "aws_vpc" "adastraec2" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "vpc-adatratsg-ghations"
  }
}

#VPC Subnet
resource "aws_subnet" "adastraec2" {
  vpc_id = aws_vpc.adastraec2.id
  cidr_block = "172.16.0.0/24"

  tags = {
    "Name" = "subnet-adatratsg-ghations"
  }
}

#VPC Network Interface
resource "aws_network_interface" "adastraec2" {
  subnet_id = aws_subnet.adastraec2.id
  private_ips = ["172.16.10.100"]

  tags = {
    "Name" = "NI-adatratsg-ghations"
  }
}

#VPC Security Group
resource "aws_security_group" "adastraec2" {
  name = "adastra-tf-ghactions-sg"
  vpc_id = aws_vpc.adastraec2.id
  ingress = {
    from_port= 8080
    to_port= 8080
    protocol= "tcp"
    cidr_block= ["0.0.0.0/0"]
  }
}

#AWS EC2
resource "aws_ec2" "adastraec2" {
  ami= "ami-00ad2436e75246bba"
  instance_type= "t2.micro"

  network_interface {
    network_interface_id= aws_network_interface.adastraec2.id
    device_index= 0
  }
}