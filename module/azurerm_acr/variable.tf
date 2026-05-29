variable "acr_dev" {
    type = map (object({
        acr_name = string
        location = string
        rg_name = string
        sku = string
        admin_enabled = bool
    }))
}