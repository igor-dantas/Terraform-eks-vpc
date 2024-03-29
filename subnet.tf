## public
resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}a"
  tags = {
    Name                     = "eks_subnet_public_1a",
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "eks_subnet_public_2b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}b"

  tags = {
    Name                     = "eks_subnet_public_2b",
    "kubernetes.io/role/elb" = 1
  }
}

## private

resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 3)

  availability_zone = "${data.aws_region.current.name}a"
  tags = {
    Name = "eks_subnet_private_1a"
  }
}

resource "aws_subnet" "eks_subnet_private_2b" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = cidrsubnet(var.cidr_block, 8, 4)

  availability_zone = "${data.aws_region.current.name}b"
  tags = {
    Name = "eks_subnet_private_2b"
  }
}