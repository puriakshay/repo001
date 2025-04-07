variable "varspi" {}

resource "azurerm_public_ip" "pip-block" {
    for_each = var.varspi
  name                = each.value.ipname
  resource_group_name = each.value.rgname
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  tags = {
    environment = "Production"
  }
}