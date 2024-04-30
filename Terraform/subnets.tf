resource "aws_subnet" "mySubnet_public_1" {
  vpc_id            = aws_vpc.myVPC.id
  cidr_block        = var.mySubnet_public_1_cidr
  availability_zone = "us-east-1a"

  depends_on = [aws_internet_gateway.gw]


  tags = {
    Name                         = var.mySubnet_public_name
    "kubernetes.io/role/elb"     = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/demo" = "owned"
  }
}
resource "aws_subnet" "mySubnet_public_2" {
  vpc_id            = aws_vpc.myVPC.id
  cidr_block        = var.mySubnet_public_2_cidr
  availability_zone = "us-east-1b"

  depends_on = [aws_internet_gateway.gw]


  tags = {
    Name                         = "publicSubnet_2"
    "kubernetes.io/role/elb"     = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/demo" = "owned"
  }
}


resource "aws_subnet" "mySubnet_private_1" {
  vpc_id            = aws_vpc.myVPC.id
  cidr_block        = var.mySubnet_private_1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name                              = var.mySubnet_private_name
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}


resource "aws_subnet" "mySubnet_private_2" {
  vpc_id            = aws_vpc.myVPC.id
  cidr_block        = var.mySubnet_private_2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name                              = "privateSubnet_2"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}