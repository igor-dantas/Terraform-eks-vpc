# Terraform EKS-VPC Module 🛠️

Este repositório contém código Terraform para provisionar uma VPC (Virtual Private Cloud) e um cluster EKS (Amazon Elastic Kubernetes Service) na AWS.

## Uso 🚀

### Chave SSH 🔑

Exemplo de utilização com chave SSH:

```hcl
module "eks"{
    source = "git@github.com:igor-dantas/Terraform-eks-vpc.git"
    cidr_block = "informe o cidr_block da vpc"
    project_name = "demoeks ou o nome que preferir"
    region = "us-east-1"
    tags = local.tags
}
```

### Chave HTTPS 🔒

Exemplo de utilização com chave HTTPS:

```hcl
module "eks"{
    source = "https://github.com/igor-dantas/Terraform-eks-vpc.git"
    cidr_block = "informe o cidr_block da vpc"
    project_name = "demoeks ou o nome que preferir"
    region = "us-east-1"
    tags = local.tags
}
```

### Arquivo `provider.tf` ⚙️

Certifique-se de criar um arquivo de provider para configurar o backend e definir onde deseja armazenar o arquivo `tf.state`.

```hcl
# antes de usar este arquivo tenha certeza que o seu usuário consegue acessar o s3
# e garanta que o s3 foi previamente criado

terraform {
  backend "s3" {
    bucket = "eks-tf-state-igor"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
```

### Arquivo `locals.tf` 🏷️

Crie um arquivo `locals.tf` para definir as tags que deseja aplicar aos seus recursos.

```hcl
locals {
  tags = {
    Department   = "Devops"
    Organization = "Idq consultoria de tecnologia"
    Project      = "Eks"
    Environment  = "development"
  }
}
```

### Nomes dos Arquivos 📂

Certifique-se de criar os seguintes arquivos:

- `main.tf`
- `backend.tf`
- `locals.tf`

Certifique-se de substituir `"informe o cidr_block da vpc"`, `"demoeks ou o nome que preferir"`, e outras informações conforme necessário.


Lembrando, você não precisa clonar esse repositório apenas seguir o tutorial acima que será possível utilizar o modulo com as suas personalizações 🚀