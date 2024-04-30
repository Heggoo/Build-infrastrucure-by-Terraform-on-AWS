
resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block     = var.private_route_table_cidr_block
    nat_gateway_id = aws_nat_gateway.nat_1.id


  }

  tags = {
    Name = var.private_route_table_1_name
  }
}

resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block     = var.private_route_table_cidr_block
    nat_gateway_id = aws_nat_gateway.nat_2.id
  }

  tags = {
    Name = var.private_route_table_2_name
  }
}



resource "aws_route_table_association" "private_route_1_association" {
  subnet_id      = aws_subnet.mySubnet_private_1.id
  route_table_id = aws_route_table.private_route_table_1.id
}
resource "aws_route_table_association" "private_route_2_association" {
  subnet_id      = aws_subnet.mySubnet_private_2.id
  route_table_id = aws_route_table.private_route_table_2.id
}
