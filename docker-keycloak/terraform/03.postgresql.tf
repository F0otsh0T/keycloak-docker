# 03.postgresql.tf

resource "docker_image" "postgresql" {
  name         = "${var.container_image_postgresql}:${var.container_tag_postgresql}"
  keep_locally = true
}

resource "docker_container" "postgresql" {
  depends_on = [
    docker_network.vault-ent-network
  ]
  image = docker_image.postgresql.name
  name  = var.container_name_postgresql
  capabilities {
    add = ["IPC_LOCK"]
  }
  networks_advanced {
    name         = docker_network.vault-ent-network.name
    aliases      = ["postgresql"]
    ipv4_address = "10.88.0.101"
  }
  ports {
    internal = var.docker_port_internal_postgresql
    external = var.docker_port_external_postgresql
  }
  restart = var.docker_restart_postgresql
  volumes {
    host_path      = var.path_postgresql_data
    container_path = "/var/lib/postgresql"
  }
  env = [
    "POSTGRES_DB=keycloak",
    "POSTGRES_USER=keycloak",
    "POSTGRES_PASSWORD=password",
    "PGDATA=/var/lib/postgresql/data"
  ]
}


