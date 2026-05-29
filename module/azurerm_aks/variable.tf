variable "aks_dev" {
    type = map (object({
        aks_name = string
        location = string
        rg_name = string
        dns_prefix = string

        default_node_pool = object({
        node_count = number
        pool_name = string
        vm_size = string
        
})
}))
  }