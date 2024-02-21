# 01.network.tf

################################################
# INFRASTRUCUTRE: NETWORK
################################################

resource "docker_network" "keycloak-network" {
  name        = "keycloak-network"
  driver      = "bridge"
  ipam_driver = "default"
  ipam_config {
    gateway = "10.89.0.1"
    subnet  = "10.89.0.0/16"
  }
}


