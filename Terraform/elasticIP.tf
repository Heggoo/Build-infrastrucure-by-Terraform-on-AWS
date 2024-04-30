resource "aws_eip" "nat_1_eip" {
  domain = "vpc"
  #instance = aws_instance.passion_side.id

}
resource "aws_eip" "nat_2_eip" {
  domain = "vpc"
  #instance = aws_instance.passion_side.id

}

