# 99.outputs.tf

# output "" {
#     value = 
# }

################################################
# DOCKER IMAGE - POSTGRESQL
################################################

output "container_image_postgresql_id" {
  value = docker_image.postgresql.id
}

output "container_image_postgresql_name" {
  value = docker_image.postgresql.name
}

################################################
# DOCKER IMAGE - KEYCLOAK
################################################

output "container_image_keycloak_id" {
  value = docker_image.keycloak.id
}

output "container_image_keycloak_name" {
  value = docker_image.keycloak.name
}

################################################
# NETWORK
################################################

output "network_name" {
  value = docker_network.keycloak-network.name
}

output "network_id" {
  value = docker_network.keycloak-network.id
}

output "network_ipam" {
  value = docker_network.keycloak-network.ipam_config
}

################################################
# POSTGRESQL INSTANCES
################################################

output "container_name_postgresql" {
  value = docker_container.postgresql.name
}

output "container_ip_postgresql" {
  value = docker_container.postgresql.network_data.0.ip_address
}

output "container_port_internal_postgresql" {
  value = docker_container.postgresql.ports.0.internal
}

output "container_port_external_postgresql" {
  value = docker_container.postgresql.ports.0.external
}

################################################
# KEYCLOAK INSTANCES
################################################

output "container_name_keycloak" {
  value = docker_container.keycloak.name
}

output "container_ip_keycloak" {
  value = docker_container.keycloak.network_data.0.ip_address
}

output "container_port_internal_keycloak" {
  value = docker_container.keycloak.ports.0.internal
}

output "container_port_external_keycloak" {
  value = docker_container.keycloak.ports.0.external
}





