variable "varsvn" {}

resource "azurerm_virtual_network" "vn-block" {
    for_each = var.varsvn
  name                = each.value.vnname
  address_space       = ["10.0.0.0/16"]
  location            = each.value.location
  resource_group_name = each.value.rgname
}