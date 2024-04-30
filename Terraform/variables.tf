variable "region" {
  type = string
}
variable "var_name" {
  type = string
}
variable "myVPC_cidr" {
  type = string
}
variable "myVPC_name" {
  type = string
}
variable "mySubnet_public_1_cidr" {
  type = string
}
variable "mySubnet_public_2_cidr" {
  type = string
}

variable "mySubnet_public_name" {
  type = string
}
variable "mySubnet_private_1_cidr" {
  type = string
}
variable "mySubnet_private_2_cidr" {
  type = string
}
variable "mySubnet_private_name" {
  type = string
}
variable "public_route_table_cidr_block" {
  type = string
}
#variable "public_route_table_ipv6_cidr_block" {
#  type = string
#}
variable "private_route_table_cidr_block" {
  type = string
}
variable "private_route_table_1_name" {
  type = string
}
variable "private_route_table_2_name" {
  type = string
}
variable "nat_1_name" {
  type = string
}
variable "nat_2_name" {
  type = string
}
variable "inventory" {
  type = string
}
variable "public_key" {
  type = string

}
variable "eks_cluster_role_name" {
  type = string
}
variable "eks_cluster_role_attachment_name" {
  type = string
}