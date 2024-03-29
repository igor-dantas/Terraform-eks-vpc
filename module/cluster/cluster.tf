resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      var.eks_subnet_public_1a,
      var.eks_subnet_public_1b
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachement
  ]
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster-eks"
    }
  )
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}