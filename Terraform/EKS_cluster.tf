resource "aws_eks_cluster" "NTI_Project_eks" {
  name     = "NTI_Project_eks"
  role_arn = aws_iam_role.eks_cluster_role.arn


  vpc_config {
    subnet_ids = [aws_subnet.mySubnet_public_1.id,
      aws_subnet.mySubnet_public_2.id,
      aws_subnet.mySubnet_private_1.id,
      aws_subnet.mySubnet_private_2.id
    ]

    endpoint_public_access  = true
    endpoint_private_access = true
  }




  depends_on = [
    aws_iam_policy_attachment.eks_cluster_policy_attachment,
    #aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}


# resource "aws_eks_addon" "coreDNS" {
#   cluster_name                = aws_eks_cluster.NTI_Project_eks.name
#   addon_name                  = "coredns"

# }
# resource "aws_eks_addon" "kube_proxy" {
#   cluster_name                = aws_eks_cluster.NTI_Project_eks.name
#   addon_name                  = "kubeproxy"

# }
# resource "aws_eks_addon" "amazon_vpc_cni" {
#   cluster_name                = aws_eks_cluster.NTI_Project_eks.name
#   addon_name                  = "amazonvpccni"

# }









# resource "aws_eks_addon" "Amazon_EKS_Pod_Identity_Agent" {
#   cluster_name                = aws_eks_cluster.NTI_Project_eks.name
#   addon_name                  = "amazonekspodidentityagent"
#   resolve_conflicts_on_update = "PRESERVE"
#   addon_version               = "v1.10.1-eksbuild.1"
# }



# resource "aws_eks_addon" "Amazon_EKS_Pod_Identity_Agent" {
#   cluster_name                = aws_eks_cluster.NTI_Project_eks.name
#   addon_name                  = "amazonekspodidentityagent"
#   addon_version               = "v1.2.0-eksbuild.1" #e.g., previous version v1.9.3-eksbuild.3 and the new version is v1.10.1-eksbuild.1
#   resolve_conflicts_on_update = "PRESERVE"
#   depends_on = [
#     aws_eks_cluster.NTI_Project_eks,
#     #aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
#   ]
# }

