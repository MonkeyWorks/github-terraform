variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource Group datacenter location"
  default     = "West Europe"
}

variable "sa_name" {
  type        = string
  description = "Storage account name"
}

#Web
variable "index_document" {
  type        = string
  description = "Name of the index document"

}

variable "source_content" {
  type        = string
  description = "Source content for the index.html file"

}

