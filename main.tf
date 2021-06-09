# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-shadowsocks-resources"
  location = var.rg_location

  tags = {
    Environment = "Terraform Samples"
    Team = "Darkato"
  }
}

resource "azurerm_container_group" "cg" {
  for_each = toset(var.container_location)

  name                = "${var.prefix}-shadowsocks-${each.key}"
  location            = each.key
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "public"
  dns_name_label      = "${var.dns_name_label}${each.key}"
  os_type             = "Linux"

  container {
    name   = "ss-${each.key}"
    image  = "mritd/shadowsocks"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = var.ss_port
      protocol = "TCP"
    }

    commands = ["ss-server", "-p", "${var.ss_port}", "-m", "${var.encryption_algo}", "-k", "${var.ss_password}"]
  }

  tags = {
    environment = "Terraform Samples"
  }
}

# Outputs
output "public_ips" {
    value = [for cg in azurerm_container_group.cg : cg.fqdn]
}

output "ss_port" {
    value = var.ss_port
}

output "encryption_algo" {
    value = var.encryption_algo
}

