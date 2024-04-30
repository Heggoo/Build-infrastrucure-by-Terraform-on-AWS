resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.myVPC.id


  route {
    cidr_block = var.public_route_table_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = var.var_name
  }
}

resource "aws_route_table_association" "example_subnet_1_association" {
  subnet_id      = aws_subnet.mySubnet_public_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "example_subnet_2_association" {
  subnet_id      = aws_subnet.mySubnet_public_2.id
  route_table_id = aws_route_table.public_route_table.id
}