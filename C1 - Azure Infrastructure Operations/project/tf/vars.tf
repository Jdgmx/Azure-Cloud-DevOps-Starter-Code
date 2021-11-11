variable "prefix" {
	description = "The prefix which should be used for all resources in the web server exercise"
	default = "WebServerEx"
}

variable "location" {
	description = "The Azure Region in which all resources in this example should be created."
	default = "eastus"
}

variable "packer_image" {
	description = "Image created with packer"
	default = "myWebServerImage"
}

variable "number_vms" {
	description = "Number of virtual machines to create"
	default = 1
}
