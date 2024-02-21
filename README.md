---
title: Keycloak on Docker
description: Keycloak and PostgreSQL on Docker
---

---
tags:
  - docker
  - arm64
  - hashicorp
  - hcp-vault
  - vault
  - hcp-terraform
  - terraform
  - keycloak
  - oidc
  - idp
  - postgresql
  - database
  - db
  - tech
alias:
  - Keycloak on Docker
---

---
# INFRA // Keycloak on Docker

Keycloak and PostgreSQL on Docker.

## Introduction

Credit goes to ***[nicklhw@github](https://github.com/nicklhw)*** as these Terraform templates are based off ***[nicklhw's](https://github.com/nicklhw/vault-keycloak/blob/main/docker-compose/docker-compose.yml)*** design and research to stand up a local Docker **Keycloak** environment.

This spins up:

- Keycloak Server in Dev Mode
- PostgreSQL Database

## Basics

- Keycloak will run in **[`dev` mode](https://www.keycloak.org/server/configuration#_starting_keycloak)**.
- Container Images:
  - PostgreSQL will utilize the [default image from Docker Hub](https://hub.docker.com/_/postgres)
  - Keycloak image will be built from a **[`Dockerfile`](./docker-keycloak/terraform/data/keycloak/Dockerfile)**
- Example ***`credentials`*** are located in **[`./docker-keycloak/terraform/03.postgresql.tf`](./docker-keycloak/terraform/03.postgresql.tf)** and **[`./docker-keycloak/terraform/04.keycloak.tf`](./docker-keycloak/terraform/04.keycloak.tf)**
  - **User**: `admin`
  - **Password**: `passw0rd`
- Network:
  - e.g. **[`./docker-keycloak/terraform/01.network.tf`](./docker-keycloak/terraform/01.network.tf)**
  - ***NOTE***: You will need to uncomment the lines in the above TF if the `vault-ent-network` does not already exist as defined in your environment.
  - Access Keycloak via browser at http://localhost:8080
- Storage:
  - e.g. **[`./docker-keycloak/terraform/02.storage.tf`](./docker-keycloak/terraform/02.storage.tf)**

## Usage

- Spin up Keycloak and PostgreSQL
  ```shell
  # cd docker-keycloak
  # make -f Makefile keycloak-all
  ```
- Remove Keycloak and PostgreSQL
  ```shell
  # cd docker-keycloak
  # make -f Makefile clean-keycloak-all
  ```


## Files

```
.
├── LICENSE
├── README.md
├── assets
├── docker-keycloak
│   ├── Makefile
│   └── terraform
│       ├── 00.variables.tf
│       ├── 00.versions.tf
│       ├── 01.network.tf
│       ├── 02.storage.tf
│       ├── 03.postgresql.tf
│       ├── 04.keycloak.tf
│       ├── 99.outputs.tf
│       └── data
│           ├── keycloak
│           │   └── Dockerfile
│           └── scripts
└── utility
```

## Requirements

- Docker
- Terraform
- jq
- GPG / PGP / Pass

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | >= 2.16.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >=2.1.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >=3.1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | >= 2.16.0 |
| <a name="provider_local"></a> [local](#provider\_local) | >=2.1.0 |
| <a name="provider_null"></a> [null](#provider\_null) | >=3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_container.keycloak](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container) | resource |
| [docker_container.postgresql](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container) | resource |
| [docker_image.keycloak](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image) | resource |
| [docker_image.postgresql](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image) | resource |
| [docker_network.keycloak-network](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/network) | resource |
| [local_file.postgresql_data](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.cleanup](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_image_keycloak"></a> [container\_image\_keycloak](#input\_container\_image\_keycloak) | Container image for Keycloak | `string` | `"testbed/keycloak"` | no |
| <a name="input_container_image_postgresql"></a> [container\_image\_postgresql](#input\_container\_image\_postgresql) | Container image for PostgreSQL | `string` | `"postgres"` | no |
| <a name="input_container_name_keycloak"></a> [container\_name\_keycloak](#input\_container\_name\_keycloak) | Specify name for your Keycloak Container | `string` | `"keycloak"` | no |
| <a name="input_container_name_postgresql"></a> [container\_name\_postgresql](#input\_container\_name\_postgresql) | Specify name for your PostgreSQL Container | `string` | `"postgresql"` | no |
| <a name="input_container_tag_keycloak"></a> [container\_tag\_keycloak](#input\_container\_tag\_keycloak) | Container image tag for Keycloak | `string` | `"latest"` | no |
| <a name="input_container_tag_postgresql"></a> [container\_tag\_postgresql](#input\_container\_tag\_postgresql) | Container image tag for PostgreSQL | `string` | `"latest"` | no |
| <a name="input_docker_port_external_keycloak"></a> [docker\_port\_external\_keycloak](#input\_docker\_port\_external\_keycloak) | Specify Keycloak External Port Number | `string` | `"8080"` | no |
| <a name="input_docker_port_external_postgresql"></a> [docker\_port\_external\_postgresql](#input\_docker\_port\_external\_postgresql) | Specify PostgreSQL External Port Number | `string` | `"5432"` | no |
| <a name="input_docker_port_internal_keycloak"></a> [docker\_port\_internal\_keycloak](#input\_docker\_port\_internal\_keycloak) | Specify Keycloak Internal Port Number | `string` | `"8080"` | no |
| <a name="input_docker_port_internal_postgresql"></a> [docker\_port\_internal\_postgresql](#input\_docker\_port\_internal\_postgresql) | Specify PostgreSQL Internal Port Number | `string` | `"5432"` | no |
| <a name="input_docker_restart_keycloak"></a> [docker\_restart\_keycloak](#input\_docker\_restart\_keycloak) | Specify restart policy for your Keycloak Container | `string` | `"always"` | no |
| <a name="input_docker_restart_postgresql"></a> [docker\_restart\_postgresql](#input\_docker\_restart\_postgresql) | Specify restart policy for your PostgreSQL Container | `string` | `"always"` | no |
| <a name="input_path_postgresql_data"></a> [path\_postgresql\_data](#input\_path\_postgresql\_data) | Specify path on local disk to mount PostgreSQL /vault/data | `string` | `"/var/tmp/volume/keycloak/postgresql"` | no |
| <a name="input_postgresql_db"></a> [postgresql\_db](#input\_postgresql\_db) | Specify name for your PostgreSQL Database | `string` | `"keycloak"` | no |
| <a name="input_postgresql_password"></a> [postgresql\_password](#input\_postgresql\_password) | Specify name for your PostgreSQL Password | `string` | `"password"` | no |
| <a name="input_postgresql_user"></a> [postgresql\_user](#input\_postgresql\_user) | Specify name for your PostgreSQL User | `string` | `"keycloak"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_image_keycloak_id"></a> [container\_image\_keycloak\_id](#output\_container\_image\_keycloak\_id) | n/a |
| <a name="output_container_image_keycloak_name"></a> [container\_image\_keycloak\_name](#output\_container\_image\_keycloak\_name) | n/a |
| <a name="output_container_image_postgresql_id"></a> [container\_image\_postgresql\_id](#output\_container\_image\_postgresql\_id) | n/a |
| <a name="output_container_image_postgresql_name"></a> [container\_image\_postgresql\_name](#output\_container\_image\_postgresql\_name) | n/a |
| <a name="output_container_ip_keycloak"></a> [container\_ip\_keycloak](#output\_container\_ip\_keycloak) | n/a |
| <a name="output_container_ip_postgresql"></a> [container\_ip\_postgresql](#output\_container\_ip\_postgresql) | n/a |
| <a name="output_container_name_keycloak"></a> [container\_name\_keycloak](#output\_container\_name\_keycloak) | n/a |
| <a name="output_container_name_postgresql"></a> [container\_name\_postgresql](#output\_container\_name\_postgresql) | n/a |
| <a name="output_container_port_external_keycloak"></a> [container\_port\_external\_keycloak](#output\_container\_port\_external\_keycloak) | n/a |
| <a name="output_container_port_external_postgresql"></a> [container\_port\_external\_postgresql](#output\_container\_port\_external\_postgresql) | n/a |
| <a name="output_container_port_internal_keycloak"></a> [container\_port\_internal\_keycloak](#output\_container\_port\_internal\_keycloak) | n/a |
| <a name="output_container_port_internal_postgresql"></a> [container\_port\_internal\_postgresql](#output\_container\_port\_internal\_postgresql) | n/a |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | n/a |
| <a name="output_network_ipam"></a> [network\_ipam](#output\_network\_ipam) | n/a |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | n/a |


## Appendix
- 

## References
- https://www.terraform.io/cli/run
- https://learn.hashicorp.com/collections/terraform/docker-get-started
- https://registry.terraform.io/providers/kreuzwerker/docker
- https://hub.docker.com/_/postgres
- https://quay.io/repository/keycloak/keycloak
- https://github.com/nicklhw/vault-keycloak/blob/main/docker-compose/docker-compose.yml
- https://www.keycloak.org/server/configuration
- https://www.keycloak.org/getting-started/getting-started-docker




[[]]
