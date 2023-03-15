provider "aws" {
  region  = "eu-west-1" 
  name = "DevOps-Candidate-Lambda-Role"
}
resource "aws_iam_role" "lambda" {
  name = "DevOps-Candidate-Lambda-Role"
}

resource "aws_vpc" "vpc" {
  id = "vpc-0de2bfe0f5fc540e0"
  cidr_block = "10.0.0.0/16"
}
  

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
}


resource "aws_nat_gateway" "nat" {
  allocation_id = "nat-07863fc48f5b99110"
  subnet_id     = aws_subnet.subnet-1.id

  tags = {
    Name = "gw-NAT"
  }

  depends_on = [aws_internet_gateway.example]
}



resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "subnet-1"
  }
}


resource "aws_route_table" "my-route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }
}

resource "aws_security_group" "SG" {
  name        = "security_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]
    ipv6_cidr_blocks = [aws_vpc.vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.my-route.id
}


resource "aws_nat_gateway" "example" {
  allocation_id = aws_nat_gateway.nat.id
  subnet_id     = aws_subnet.subnet-1.id

  depends_on = [aws_internet_gateway.gw]
}


terraform {
  backend {
    S3 Bucket: "3.devops.candidate.exam"
    Region: "eu-west-1"
    Key: "Prasad.Deshmukh"
  }
}



