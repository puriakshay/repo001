variable "envrg" {}
variable "envsn" {}
variable "envvn" {}
variable "envvm" {}
variable "envni" {}
variable "envpi" {}

module "rg-mod" {
    source = "../RG"
    varrg = var.envrg
}

module "vn-mod" {
    source = "../VN"
    varsvn = var.envvn
    depends_on = [ module.rg-mod ]
}
module "sn-mod" {
    source = "../SN"
    varsn = var.envsn
    depends_on = [ module.vn-mod ]
}
module "pi-mod" {
  source = "../PI"
  varspi = var.envpi
  depends_on = [ module.rg-mod ]
}
module "ni-mod" {
  source = "../NI"
  varsni = var.envni
  datavarsnid = var.envni
  datavarspip = var.envpi
  depends_on = [ module.pi-mod,module.rg-mod,module.sn-mod ]
}
module "vm-mod" {
    source = "../VM"
    varsvm = var.envvm
    datavarniid = var.envni
    depends_on = [module.ni-mod]
  
}