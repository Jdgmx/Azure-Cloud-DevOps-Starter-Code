variable "prefix" {
	description = "The prefix which should be used for all resources in the web server exercise"
	default = "WebServerEx"
}

variable "location" {
	description = "The Azure Region in which all resources in this example should be created."
	default = "eastus"
}

variable "username" {
	type = string
	default = "joaquin.d"
}

variable "password" {
	type = string
	default = "j0aqu1n__0"
}

variable "packer_image_rg" {
	description = "Resource group where the packer image lives"
	default = "PackerImage-rg"
}

variable "packer_image" {
	description = "Image created with packer"
	default = "WebServerImage"
}

variable "number_vms" {
	description = "Number of virtual machines to create"
	default = 2
}
