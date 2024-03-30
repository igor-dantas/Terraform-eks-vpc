module "eks_network" {
  source       = "./module/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = var.tags
}

module "eks_cluster" {
  source               = "./module/cluster"
  project_name         = var.project_name
  tags                 = var.tags
  eks_subnet_public_1a = module.eks_network.subnet_pub_1a
  eks_subnet_public_1b = module.eks_network.subnet_pub_1b
}

module "eks_managed_node_group" {
  source            = "./module/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  tags              = var.tags
}

module "eks_load_balancer_controller" {
  source       = "./module/aws-load-balancer-controller"
  project_name = var.project_name
  tags         = var.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
}