module "eks_network" {
  source       = "./module/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}