################################################################################
# MAKEFILE
#
# @file
# @version 0.1
#
##########
# PREREQUISITES
#   - Docker
#   - make
#   - jq
#   - curl
#   - PGP / pass
#   - Terraform
################################################################################

#SHELL := /bin/bash

########################
# FOUNDATION
########################
default: help
.PHONY: clean-keycloak clean-keycloak-volume clean-keycloak-all clean-all keycloak-all keycloak-setup
ACTION ?= plan

########################
# CLEAN
########################
clean-keycloak: #target ## Clean Keycloak
	@terraform -chdir=./terraform destroy -auto-approve

clean-keycloak-volume: #target ## Clean Keycloak Volume
	@rm -rf /var/tmp/volume/keycloak/*

clean-keycloak-all: clean-keycloak clean-keycloak-volume #target ## Clean Keycloak All

clean-all: clean-keycloak-all #target ## Clean All

################################
# SETUP AND RUN KEYCLOAK - PERSIST DATA WITH FILE VOLUME
# MAY NEED TO ENABLE FILE SHARING TO DOCKER VIA:
# DOCKER >> PREFERENCES >> RESOURCES >> FILE SHARING
################################
keycloak-all: keycloak-setup #target ## All Setup Targets for Keycloak Services

keycloak-setup: #target ## Spin Up Keycloak Resources
	@terraform -chdir=./terraform init && terraform -chdir=./terraform apply -auto-approve

########################
# HELP
# REF GH @ jen20/hashidays-nyc/blob/master/terraform/GNUmakefile
########################
.PHONY: help
help: #target ## Display help for this Makefile (default target).
	@echo "Valid targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

check_defined = \
		$(strip $(foreach 1,$1, \
		$(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
		$(if $(value $1),, \
		$(error Undefined $1$(if $2, ($2))))

