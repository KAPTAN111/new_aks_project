module "rg" {
  source = "../../module/azurerm_rg"
  rg_dev = var.rg_devA
}
#use kar rahe hai
module "acr" {
  source  = "../../module/azurerm_acr"
  acr_dev = var.acr_devA
}
module "aks" {
  source  = "../../module/azurerm_aks"
  aks_dev = var.aks_devA
}