variable "varsn" {}

resource "azurerm_subnet" "sn-block" {
    for_each = var.varsn
  name                 = each.value.snname
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnname
  address_prefixes     = each.value.address_prefixes
}