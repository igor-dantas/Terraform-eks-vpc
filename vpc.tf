# resource "nome_do_recurso"  "nome_personalizado_do_recurso"
resource "aws_vpc" "eks_vpc" {
  cidr_block = var.cidr_block
  # enable_dns_support = true é default, mas vamos deixar o mais verboso possível
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    local.tags,
    {
      Name = "eks-vpc"
    }
  )
}