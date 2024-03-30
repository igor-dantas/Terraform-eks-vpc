data "tls_certificate" "eks_oidc_tls_certificates" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "example" {
  client_id_list = [
    "sts.amazonaws.com"
  ]
  thumbprint_list = data.tls_certificate.eks_oidc_tls_certificates.certificates[*].sha1_fingerprint
  url             = data.tls_certificate.eks_oidc_tls_certificates.url

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-oidc"
    }
  )
}