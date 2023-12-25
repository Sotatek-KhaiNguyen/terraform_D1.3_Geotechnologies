variable "common" {
  type = object({
    project = string
    env = string
    region = string
    account_id = string
  })
}

variable "rds_engine" {
    type = string
}

variable "rds_engine_version" {
    type = string
}

variable "rds_name" {
    type = string
}

variable "rds_username" {
    type = string
}

variable "rds_password" {
    type = string
}

variable "rds_class" {
    type = string
}

variable "rds_strorage" {
    type = string
}

variable "rds_network" {
    type = object({
        vpc_id =  string
        subnet_ids = list(string)
        rds_sg = string
    })
}

variable "rds_port" {
  type = string
}

variable "rds_family" {
    type = string
}