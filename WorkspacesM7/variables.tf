variable "rg-ws-name" {
  type        = string
  description = "Resource group for workspace name"
}

variable "rg-ws-location" {
  type        = string
  description = "Resource group for workspace location"
}

variable "sa-ws-name" {
  type        = string
  description = "Storage account for workspace name"
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


