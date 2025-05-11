variable "rg_name" {
  type        = string
  description = "Resource group name"
  default = "rg-mw"
}

variable "location" {
  type        = string
  description = "Resource Group datacenter location"
  default     = "West Europe"
}

variable "sa_name" {
  type        = string
  description = "Storage account name"
  default = "saweb"
}

#Web
variable "index_document" {
  type        = string
  description = "Name of the index document"
    default = "index_html"
}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"
  default = "<h1>Made with Terraform - CI/CD:</h1>"
}

#Storage blob

variable "sc_name" {
  type = string
  description = "Storage container for storage blob"
  default = "storcount"  
}

variable "sb_name" {
  type = string
  description = "Storage blob for files"
  default = "storblob"
}

variable "sb_content_name" {
  type = string
  description = "File name"
  default = "HelloWorld"
}

variable "sb_content_name_extension" {
  type = string
  description = "File extension type"
  default = ".txt"
}

variable "sb_content" {
  type = string
  description = "File content"
  default = "\"Hello World\""
  
}