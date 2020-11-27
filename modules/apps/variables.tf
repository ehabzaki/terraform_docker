variable app_image_name {
  type = string
  default = "rate"
}
variable env {
  type = string
  default = "dev"
}

variable "db_user" {
  type = string
  default = "postgres"
}
variable mount_source {
  type = string
  default = "rate"
}

variable db_name {
  type = string
  default = "rate"
}

variable db_port {
    type = string
  default = "5432"
}
variable app_port {
    type = string
  default = "3000"
}