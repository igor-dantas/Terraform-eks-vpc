module "eks_network" {
  source       = "./module/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source               = "./module/cluster"
  project_name         = var.project_name
  tags                 = local.tags
  eks_subnet_public_1a = module.eks_network.subnet_pub_1a
  eks_subnet_public_1b = module.eks_network.subnet_pub_1b
}