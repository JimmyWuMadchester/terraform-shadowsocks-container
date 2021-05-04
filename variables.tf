# Predefined in terraform.tfvars
variable "rg_location" {}
variable "container_location" {}
variable "ss_port" {}
variable "encryption_algo" {}

# Settable variables
variable "prefix" {
  description = "The prefix used for all resources in this example"
}

variable "dns_name_label" {
    description = "The subdomain name for ss servers"
}

variable "ss_password" {
    type = string
    description = "Password for your Shadowsocks connections"
}