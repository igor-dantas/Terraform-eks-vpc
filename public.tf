## public subnet
resource "aws_subnet" "eks_subnet_public_1a" {
  # dessa forma abaixo estamos pegando o nome da vpc dinamicamente
  vpc_id = aws_vpc.eks_vpc.id
  # cidrsubnet é uma function do terraform para calcular os ips necessários para as subnets dinamicamente
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  map_public_ip_on_launch = true
  # dessa forma usamos o data para capturar uma informação que é a região que meu usuario está configurado
  availability_zone = "${data.aws_region.current.name}a"
  # com a função merge eu consigo mergear as tags padrões que estão no locals.tf com as tags especificas para cada subnet
  tags = merge(
    local.tags,
    {
      Name                     = "eks_subnet_public_1a",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "eks_subnet_public_2b" {
  # dessa forma abaixo estamos pegando o nome da vpc dinamicamente
  vpc_id = aws_vpc.eks_vpc.id
  # cidrsubnet é uma function do terraform para calcular os ips necessários para as subnets dinamicamente
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  map_public_ip_on_launch = true
  # dessa forma usamos o data para capturar uma informação que é a região que meu usuario está configurado
  availability_zone = "${data.aws_region.current.name}b"
  # com a função merge eu consigo mergear as tags padrões que estão no locals.tf com as tags especificas para cada subnet
  tags = merge(
    local.tags,
    {
      Name                     = "eks_subnet_public_2b",
      "kubernetes.io/role/elb" = 1
    }
  )
}