provider "aws" {
    S3 Bucket: "3.devops.candidate.exam"
    Region: "eu-west-1"
    Key: "Prasad.Deshmukh"
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


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.my-route.id
}


resource "aws_nat_gateway" "example" {
  allocation_id = aws_nat_gateway.nat.id
  subnet_id     = aws_subnet.subnet-1.id

  depends_on = [aws_internet_gateway.gw]
}




data "aws_iam_role" "lambda" {
  name = "DevOps-Candidate-Lambda-Role"
}