# 00.variables.tf

# variable "" {
#     type = string
#     description = ""
#     sensitive = false
#     default = ""
# }

################################################
# NETWORK VARIABLES


variable "vault-ent-network" {
  type        = string
  description = "Specify name for your Docker Network"
  sensitive   = false
  default     = "vault-ent-network"
}


################################################
# POSTGRESQL VARIABLES

variable "path_postgresql_data" {
  type        = string
  description = "Specify path on local disk to mount PostgreSQL /vault/data"
  sensitive   = false
  default     = "/var/tmp/volume/keycloak/postgresql"
}

variable "container_image_postgresql" {
  type        = string
  description = "Container image for PostgreSQL"
  sensitive   = false
  default     = "postgres"
}

variable "container_tag_postgresql" {
  type        = string
  description = "Container image tag for PostgreSQL"
  sensitive   = false
  default     = "latest"
}

variable "container_name_postgresql" {
  type        = string
  description = "Specify name for your PostgreSQL Container"
  sensitive   = false
  default     = "postgresql"
}

variable "postgresql_db" {
  type        = string
  description = "Specify name for your PostgreSQL Database"
  sensitive   = false
  default     = "keycloak"
}

variable "postgresql_user" {
  type        = string
  description = "Specify name for your PostgreSQL User"
  sensitive   = false
  default     = "keycloak"
}

variable "postgresql_password" {
  type        = string
  description = "Specify name for your PostgreSQL Password"
  sensitive   = true
  default     = "password"
}

variable "docker_restart_postgresql" {
  type        = string
  description = "Specify restart policy for your PostgreSQL Container"
  sensitive   = false
  default     = "always"
}

variable "docker_port_internal_postgresql" {
  type = string
  description = "Specify PostgreSQL Internal Port Number"
  sensitive = false
  default = "5432"
}

variable "docker_port_external_postgresql" {
  type = string
  description = "Specify PostgreSQL External Port Number"
  sensitive = false
  default = "5432"
}

################################################
# KEYCLOAK VARIABLES

variable "container_image_keycloak" {
  type        = string
  description = "Container image for Keycloak"
  sensitive   = false
  default     = "testbed/keycloak"
}

variable "container_tag_keycloak" {
  type        = string
  description = "Container image tag for Keycloak"
  sensitive   = false
  default     = "latest"
}

variable "container_name_keycloak" {
  type        = string
  description = "Specify name for your Keycloak Container"
  sensitive   = false
  default     = "keycloak"
}

variable "docker_port_internal_keycloak" {
  type = string
  description = "Specify Keycloak Internal Port Number"
  sensitive = false
  default = "8080"
}

variable "docker_port_external_keycloak" {
  type = string
  description = "Specify Keycloak External Port Number"
  sensitive = false
  default = "8080"
}

variable "docker_restart_keycloak" {
  type        = string
  description = "Specify restart policy for your Keycloak Container"
  sensitive   = false
  default     = "always"
}




