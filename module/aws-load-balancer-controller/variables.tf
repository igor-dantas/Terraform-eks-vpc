variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources"
}


variable "tags" {
  type        = map(any)
  description = "Tag to be added to the resources"
}

variable "oidc" {
  type        = string
  description = "https url from oidc provider of the eks cluster"

}

variable "cluster_name" {
  type        = string
  description = "eks cluster name"
}