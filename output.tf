output "oidc" {
  value = module.eks_cluster.oidc
}


output "endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "ca" {
  value = module.eks_cluster.cluster_certificate_authority
}