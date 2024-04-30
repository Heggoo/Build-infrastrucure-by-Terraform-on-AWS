resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.nat_1_eip.id
  subnet_id     = aws_subnet.mySubnet_public_1.id

  tags = {
    Name = var.nat_1_name
  }
}
resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.nat_2_eip.id
  subnet_id     = aws_subnet.mySubnet_public_2.id

  tags = {
    Name = var.nat_2_name
  }
}

