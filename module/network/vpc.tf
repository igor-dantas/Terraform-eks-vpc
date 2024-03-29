resource "aws_vpc" "eks_vpc" {
  cidr_block = var.cidr_block
  # enable_dns_support = true é default, mas vamos deixar o mais verboso possível
  enable_dns_support   = true
  enable_dns_hostnames = true
  # com a função merge eu consigo mergear as tags padrões que estão no locals.tf com as tags especificas para vpc
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-vpc"
    }
  )
}