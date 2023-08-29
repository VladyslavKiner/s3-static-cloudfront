variable "region" {
  type = string
}

variable "name" {

}

variable "domain_name" {
  type = string
}

variable "name_tag" {
  type = list(any)
}

variable "allowed_methods" {
  type = list(any)
}