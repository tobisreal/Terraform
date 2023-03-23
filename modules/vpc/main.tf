resource "aws_vpc" "nameofvpc" {
  cidr_block           = var.vpc_cidr_block

  tags = {
    Name               = var.vpc_name
  }
}

resource "aws_subnet" "nameofsubnet" {
  vpc_id               = aws_vpc.nameofvpc.id
  cidr_block           = var.subnet_cidr_block
  availability_zone    = var.availability_zone

  tags = {
    Name               = var.subnet_name
  }
}

resource "aws_internet_gateway" "nameofigw" {
  vpc_id               = aws_vpc.nameofvpc.id

  tags = {
    Name               = var.internet_gateway_name
  }
}

resource "aws_route_table" "nameofroutetable" {
  vpc_id               = aws_vpc.nameofvpc.id

  route {
    cidr_block         = "0.0.0.0/0"
    gateway_id         = aws_internet_gateway.nameofigw.id
  }

  tags = {
    Name               = var.route_table_name
  }
}

resource "aws_route_table_association" "nameofroutetableassociation" {
  subnet_id            = aws_subnet.nameofsubnet.id
  route_table_id       = aws_route_table.nameofroutetable.id
}
