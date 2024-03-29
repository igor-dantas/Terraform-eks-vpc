resource "aws_eip" "eks_ngw_eip_1a" {
  domain = "vpc"
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "eks_ngw_eip_2b" {
  domain = "vpc"
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-eip-2b"
    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_igw]
}

resource "aws_nat_gateway" "eks_ngw_2b" {
  allocation_id = aws_eip.eks_ngw_eip_2b.id
  subnet_id     = aws_subnet.eks_subnet_public_2b.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-2b"
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_igw]
}


resource "aws_route_table" "eks_private_route_table_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

resource "aws_route_table" "eks_private_route_table_2b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_2b.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-2b"
    }
  )
}