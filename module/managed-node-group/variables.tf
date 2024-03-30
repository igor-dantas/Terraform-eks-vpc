variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources"
}


variable "tags" {
  type        = map(any)
  description = "Tag to be added to the resources"
}

variable "cluster_name" {
  type        = string
  description = "Name of eks cluster to mng"
}

variable "subnet_private_1a" {
  type        = string
  description = "Subnet from AZ 1a"
}

variable "subnet_private_1b" {
  type        = string
  description = "Subnet from AZ 1b"
}