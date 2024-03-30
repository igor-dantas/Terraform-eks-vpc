variable "cidr_block" {
  type        = string
  description = "Cidr block to be used for the vpc"
}
variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources"
}

variable "region" {
  type        = string
  description = "Region of the project you want to use"
}

variable "tags" {
  type        = map(any)
  description = "map of tags to add on all aws resources"
}