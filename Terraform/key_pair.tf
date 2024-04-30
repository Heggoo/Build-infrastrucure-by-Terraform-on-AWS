resource "aws_key_pair" "myKey" {
  key_name   = "deployer-key"
  public_key = var.public_key


  # tags = {
  #   name = "NTI_project_Key" 
  # }
}