# resource "nome_do_recurso"  "nome_personalizado_do_recurso"
resource "aws_vpc" "eks_vpc" {
  cidr_block = "20.230.0.0/16"
# enable_dns_support = true é default, mas vamos deixar o mais verboso possível
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      Name = "eks-vpc"
    }
}