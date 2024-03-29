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
      Name                     = "${var.project_name}_subnet_public_1a",
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
      Name                     = "${var.project_name}_subnet_public_2b",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "eks_rtb_assoc_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_rtb_assoc_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_2b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}