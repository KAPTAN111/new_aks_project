variable "rg_dev" {
    type = map (object({
        rg_name = string
        location = string   
    }))
}
