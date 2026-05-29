resource "azurerm_kubernetes_cluster" "aks1" {
  for_each            = var.aks_dev
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix

  dynamic "default_node_pool" {
    for_each = [each.value.default_node_pool]
    content {
      name       = default_node_pool.value.pool_name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks1["aks_dev_ram"].kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks1["aks_dev_ram"].kube_config_raw

  sensitive = true
}
