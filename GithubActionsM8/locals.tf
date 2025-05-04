locals {
  ls_ws_suffix  = terraform.workspace
  ls_rg_name    = "${var.rg_name}-${local.ls_ws_suffix}"
  ls_web_suffix = "<h1>${local.ls_ws_suffix}</h1>"
}