resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

tags = {
    Name    = "vpc-TerraformClass"
    Owner   = "cferrer"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name    = "subnet-Publica"
    Owner   = "cferrer"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "IG-TerraformClass"
    Owner   = "cferrer"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public_Table"
    Owner = "CFerrer"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.public.id
}