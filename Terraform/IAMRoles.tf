resource "aws_iam_role" "eks_cluster_role" {
  name = var.eks_cluster_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      },
      Action = "sts:AssumeRole",
      Condition = {
        StringEquals = {
          "sts:ExternalId" = "eks-cluster"
        }
      }
    }]
  })
}


resource "aws_iam_policy_attachment" "eks_cluster_policy_attachment" {
  name       = "AmazonEKSClusterPolicyAttachment"
  roles      = [aws_iam_role.eks_cluster_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# resource "aws_iam_role" "eks_cluster_role" {
#   name = "eks-cluster-role"

#   assume_role_policy = <<-POLICY
#     {
#       "Version": "2012-10-17",
#       "Statement": [
#         {
#           "Effect": "Allow",
#           "Principal": {
#             "Service": "eks.amazonaws.com"
#           },
#           "Action": "sts:AssumeRole",
#           "Condition": {
#             "StringEquals": {
#               "sts:ExternalId": "eks-cluster"
#             }
#           }
#         }
#       ]
#     }
#   POLICY
# }

######################################--------- NODE GROUP POLICY -------##################################################

resource "aws_iam_role" "nodes" {
  name = "eks-node-group-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes.name
}
