variable "cidr_block" {
  type        = string
  description = "Cidr block to be used for the vpc"
}

variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources"
}

variable "tags" {
  type        = map(any)
  description = "Tag to be added to the resources"
}