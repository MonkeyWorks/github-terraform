variable "rg_name" {
  type        = string
  description = "Resource group name"
  default = "rgname"
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
  default = "<h1>Made with Terraform</h1>"
}

