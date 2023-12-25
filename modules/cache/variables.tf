variable "common" {
  type = object({
    project = string
    env = string
    region = string
    account_id = string
  })
}

variable "vpc_id" {
    type = string
}

variable "subnet_ids" {
    type = list(string)
}

variable "redis_sg" {
    type = string
}

variable "redis_engine_version" {
    type = string
}

variable "num_cache_nodes" {
    type = string
}

variable "node_type" {
    type = string
}

variable "port" {
    type = string
}