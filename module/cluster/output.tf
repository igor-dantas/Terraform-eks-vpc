output "eks_vpc_config" {
  value = aws_eks_cluster.eks_cluster.vpc_config
}

output "oidc" {
  value = data.tls_certificate.eks_oidc_tls_certificates.certificates[*].sha1_fingerprint
}