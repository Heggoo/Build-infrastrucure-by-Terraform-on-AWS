var_name = "NTI_test"
region   = "us-east-1"

myVPC_cidr = "10.0.0.0/16"
myVPC_name = "NTI_test"

mySubnet_public_1_cidr = "10.0.3.0/24"
mySubnet_public_2_cidr = "10.0.4.0/24"
mySubnet_public_name   = "publicSubnet_1"

mySubnet_private_1_cidr = "10.0.1.0/24"
mySubnet_private_2_cidr = "10.0.2.0/24"
mySubnet_private_name   = "privateSubnet_1"

public_route_table_cidr_block = "0.0.0.0/0"
#public_route_table_ipv6_cidr_block = "::/0"
private_route_table_cidr_block = "0.0.0.0/0"

private_route_table_1_name = "NTI_PrivateRouteTable_1"
private_route_table_2_name = "NTI_PrivateRouteTable_2"

nat_1_name = "nat_1_project"
nat_2_name = "nat_2_project"

inventory  = "./ansible/inventory"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCsNdz9NnodKG5uRKlJ0TQ5m+4WBjiTKnS7BQsgQMKnBq1CQQIhmGQrQTpw8iHWETbotI7E8hIw/d/h/pcduuKxZB+AMr45FlpDnxVezQ87TjB36jJlD/E3zGF9PsxnQ3Q39esCX2H7MPicwqXPjgld9uZj0DkRwWJ/lVyuce6gvOpJv4EDTMgT8BEhPf101ET2oG6nUEcv5kam3RPTaJFVepsWQenUOzeGcSpOsvyf5GRSFw0EWIt6mMQs2lekKjTJdFvVXWt69awsnidkNEcwVjxOkKEZ3Fedg68pSu1MM3GR49Q5Rkey7OXgKOqWyVKPu+LDcavxrBlZNMRE0WR Heggo@Heggo"

eks_cluster_role_name            = "eks-cluster-role"
eks_cluster_role_attachment_name = "AmazonEKSClusterPolicyAttachment"
