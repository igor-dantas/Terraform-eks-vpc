# antes de usar este arquivo tenha certeza que o seu usuário consegue acessar o s3
# e garanta que o s3 foi previamente criado
terraform {
  backend "s3" {
    bucket = "eks-tf-state-igor"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

# objetivo deste arquivo é salvar o state do terraform
# de forma remota