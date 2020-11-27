provider "docker" {}

resource "null_resource" "rates" {

provisioner "local-exec" {
    command = "docker build -t ${var.app_image_name} rates/"
  }
  
#provisioner "local-exec" {
#   when    = destroy
#    command = "docker  rmi ${var.app_image_name}"
 # }
}

resource "docker_network" "db" {
  name = "db_${var.env}"
}
resource "docker_container" "db" {
  name  = "db_${var.env}"
  image = "postgres:9.6"
  restart = "always"
  user = "postgres:postgres"
  env = [
     #"POSTGRES_PASSWORD=mypassword",
     "POSTGRES_DB=${var.db_name}",
     "POSTGRES_HOST_AUTH_METHOD=trust",
     "PGDATA=/var/lib/postgresql/data/pgdata"
     ]
  mounts {
    type = "volume"
    target = "/var/lib/postgresql/data"
    source =  "${var.mount_source}_${var.env}" 
  }
  upload {
      source = "db/rates.sql"
      file = "/docker-entrypoint-initdb.d/rates.sql"


  }
  networks_advanced {
   name = docker_network.db.name

  }
  ports {
  internal = "5432"
  external = var.db_port
  }
}

resource "docker_container" "app" {
  name  = "app_${var.env}"
  image = var.app_image_name
  depends_on = [null_resource.rates, docker_container.db]
  restart = "always"
  networks_advanced {
   name = docker_network.db.name
  }
  ports {
    internal = "3000"
    external = var.app_port
  } 
  env = [
    "db_host=${docker_container.db.name}",
    "db_user=postgres",
    "db_name=${var.db_name}"
  ]

}


