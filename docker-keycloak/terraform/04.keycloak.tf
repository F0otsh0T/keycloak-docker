# 04.keycloak.tf

resource "docker_image" "keycloak" {
  name         = "${var.container_image_keycloak}:${var.container_tag_keycloak}"
  keep_locally = true
  build {
    context = "./data/keycloak"
    tag     = ["keycloak/keycloak:latest"]
  }
}

resource "docker_container" "keycloak" {
  depends_on = [
    docker_network.vault-ent-network,
    docker_container.postgresql
  ]
  image = docker_image.keycloak.name
  name  = var.container_name_keycloak
  capabilities {
    add = ["IPC_LOCK"]
  }
  networks_advanced {
    name         = docker_network.vault-ent-network.name
    aliases      = ["keycloak"]
    ipv4_address = "10.88.0.100"
  }
  ports {
    internal = var.docker_port_internal_keycloak
    external = var.docker_port_external_keycloak
  }
  restart = var.docker_restart_keycloak
  healthcheck {
    test = ["CMD", "curl", "-f", "http://localhost:8080"]
    # interval = "30s"
    # timeout = "10s"
    # retries = 5
  }
  env = [
    "KC_DB=postgres",
    "KC_DB_USERNAME=keycloak",
    "KC_DB_PASSWORD=password",
    "KC_DB_URL=jdbc:postgresql://postgresql:5432/keycloak",
    "KC_METRICS_ENABLED=true",
    "KEYCLOAK_ADMIN=admin",
    "KEYCLOAK_ADMIN_PASSWORD=passw0rd"
  ]
  command = [
    "start-dev"
  ]
}






