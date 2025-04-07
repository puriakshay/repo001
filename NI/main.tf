variable "varsni" {}
variable "datavarsnid" {}
variable "datavarspip" {}

resource "azurerm_network_interface" "ni-block" {
    for_each = var.varsni
  name                = each.value.niname
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = each.value.ipname
    subnet_id                     = data.azurerm_subnet.datablock-snid[each.key].id
    private_ip_address_allocation = each.value.address_allocation
    public_ip_address_id = data.azurerm_public_ip.datablock-pip[each.key].id
  }
}
data "azurerm_subnet" "datablock-snid" {
    for_each = var.datavarsnid
  name                 = each.value.snname
  virtual_network_name = each.value.vnname
  resource_group_name  = each.value.rgname
}

data "azurerm_public_ip" "datablock-pip" {
    for_each = var.datavarspip
  name                = each.value.ipname
  resource_group_name = each.value.rgname
}

