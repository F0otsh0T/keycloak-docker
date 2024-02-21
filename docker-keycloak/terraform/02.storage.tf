# 02.storage.tf

################################################

resource "null_resource" "cleanup" {
  /*   provisioner "local-exec" {
    #    command = "rm -rf ${var.path_vault_config}"
    command = "mv ${var.path_vault_config} /tmp"
  }
  provisioner "local-exec" {
    #    command = "rm -rf ${var.path_vault_file}"
    command = "mv ${var.path_vault_file} /tmp"
  } */
}

################################################
# INFRASTRUCUTRE: STORAGE - POSTGRESQL
################################################

resource "local_file" "postgresql_data" {
  depends_on = [
    null_resource.cleanup
  ]
  content         = "postgresql"
  filename        = "${var.path_postgresql_data}/placeholder.txt"
  file_permission = "0644"
  /*   provisioner "local-exec" {
    when    = destroy
    command = "cp -r ${dirname(self.filename)} /tmp/"
  } */
}

