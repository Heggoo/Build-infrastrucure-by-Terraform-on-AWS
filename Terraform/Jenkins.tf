data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

resource "aws_instance" "Jenkins" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.mySubnet_public_1.id
  key_name      = aws_key_pair.myKey.id
  root_block_device {
    volume_size = 15
  }

  associate_public_ip_address = true
  security_groups             = [aws_security_group.myApp_sg.id]
  user_data                   = file("Jenkins_req.sh")

  tags = {
    Name = "NTI_project_mybastion"
  }

  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/Heggo/Desktop/NTI FINAL/deployer-key.pem")


  }


}

resource "local_file" "public_ip_file" {
  depends_on = [aws_instance.Jenkins]
  filename   = var.inventory
  content    = aws_instance.Jenkins.public_ip
}





#  output "instance_ip_addr" {
#   value = aws_instance.Jenkins.private_ip 
#  }

#  output "passion_public_ip" {
#   value = aws_instance.Jenkins.public_ip

#     depends_on = [
#     aws_instance.Jenkins,
#   ]
#  }

# resource "aws_instance" "myApp" {
#   ami = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.mySubnet_private_1.id
#   key_name = aws_key_pair.myKey.id 
# #  associate_public_ip_address = true
#   security_groups  = [aws_security_group.myApp_sg.id]
#   user_data = "${file("apache.sh")}"
#   tags = {
#     Name = "NTI_myApp"
#   }
# }

# output "myApp_private_ip" {
#   value = aws_instance.myApp.private_ip
# }


