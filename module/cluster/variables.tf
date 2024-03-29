variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources"
}


variable "tags" {
  type        = map(any)
  description = "Tag to be added to the resources"
}

variable "eks_subnet_public_1a" {
  type        = string
  description = "Subnet to create eks cluster 1A"
}


variable "eks_subnet_public_1b" {
  type        = string
  description = "Subnet to create eks cluster 1B"
}