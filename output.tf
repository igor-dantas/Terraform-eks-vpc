output "eks_subnet_public_1a" {
  value = module.eks_network.subnet_pub_1a
}
output "eks_subnet_public_1b" {
  value = module.eks_network.subnet_pub_1b
}


output "eks_subnet_private_1a" {
  value = module.eks_network.subnet_priv_1a
}

output "eks_subnet_private_1b" {
  value = module.eks_network.subnet_priv_1b
}

output "eks_vpc_config" {
  value = module.eks_cluster.eks_vpc_config[0]
}
