# 01.network.tf

################################################
# INFRASTRUCUTRE: NETWORK
################################################


################################################
# Uncomment the following code block
# if you need this network
# (not previously created in the same project)


# resource "docker_network" "vault-ent-network" {
#   name        = "vault-ent-network"
#   driver      = "bridge"
#   ipam_driver = "default"
#   ipam_config {
#     gateway = "10.88.0.1"
#     subnet  = "10.88.0.0/16"
#   }
# }

