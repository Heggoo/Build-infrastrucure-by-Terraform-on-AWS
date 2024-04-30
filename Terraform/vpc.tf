resource "aws_vpc" "myVPC" {
  cidr_block = var.myVPC_cidr

  tags = {
    Name = var.myVPC_name
  }
}