variable "common" {
  type = object({
    project = string
    env = string
    region = string
    account_id = string
  })
}

variable "amazon_image" {
    type = list(string)
}

variable "ssh_public_key" {
    type = string
}

variable "network_settings" {
    type = object({
        vpc_id = string
        subnet_ids = list(string)
        security_group = string
    })
}