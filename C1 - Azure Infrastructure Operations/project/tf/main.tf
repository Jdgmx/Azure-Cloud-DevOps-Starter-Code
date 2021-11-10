provider "azurerm" {
	features { }
}

# Create the resource group
resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-rg"
  location = var.location
}

# Create the virtual network
resource "azurerm_virtual_network" "main" {
	name                = "${var.prefix}-network"
	address_space       = ["10.0.2.0/24"]
	location            = azurerm_resource_group.main.location
	resource_group_name = azurerm_resource_group.main.name
}

# Do the virtual network require this? Do the address_space and address_prefixes need to be the same?
resource "azurerm_subnet" "internal" {
	name                 = "internal"
	resource_group_name  = azurerm_resource_group.main.name
	virtual_network_name = azurerm_virtual_network.main.name
	address_prefixes     = ["10.0.2.0/24"]
}

# Security group, like the firewall rules, I guess.
resource "azurerm_network_security_group" "security" {
	name                = "${var.prefix}-sg""
	location            = azurerm_resource_group.main.location
	resource_group_name = azurerm_resource_group.main.name

	# No inbound from anywhere
	security_rule {
		name                       = "NoInternetIn"
		priority                   = 100
		direction                  = "Inbound"
		access                     = "Deny"
		protocol                   = "*"
		source_port_range          = "*"
		destination_port_range     = "*"
		source_address_prefix      = "*"
		destination_address_prefix = "*"
	}

	# Only allow between virtual network (should be azurerm_virtual_network.main.name ?)
	security_rule {
		name                       = "VMAccess"
		priority                   = 200
		direction                  = "Inbound"
		access                     = "Allow"
		protocol                   = "*"
		source_port_range          = "*"
		destination_port_range     = "*"
		source_address_prefix      = "VirtualNetwork"
		destination_address_prefix = "VirtualNetwork"
	}

	tags = {
		lesson = 1
	}
}

# A public IP, but how do I know what IP is it?
resource "azurerm_public_ip" "public_ip" {
	name                = "${var.prefix}-publicIp"
	resource_group_name = azurerm_resource_group.main.name
	location            = azurerm_resource_group.main.location
	allocation_method   = "Static"
#	sku                 = "Basic"

	tags = {
		lesson = 1
	}
}

# Internal NIC
resource "azurerm_network_interface" "internal" {
	name                = "${var.prefix}-nic-int"
	resource_group_name = azurerm_resource_group.main.name
	location            = azurerm_resource_group.main.location
	
	ip_configuration {
		name                          = "internal"
		subnet_id                     = azurerm_subnet.internal.id
		private_ip_address_allocation = "Dynamic"
	}
	
	tags = {
		lesson = 1
	}
}

# External NIC
# resource "azurerm_network_interface" "external" {
# 	name                = "${var.prefix}-nic-ext"
# 	resource_group_name = azurerm_resource_group.main.name
# 	location            = azurerm_resource_group.main.location
# 	
# 	ip_configuration {
# 		name                          = "external"
# 		subnet_id                     = azurerm_subnet.internal.id
# 		private_ip_address_allocation = "Dynamic"
# 		public_ip_address_id          = azurerm_public_ip.public_ip.id
# 	}
# 	
# 	tags = {
# 		lesson = 1
# 	}
# }

# Load balancer (this is a jump of faith)
resource "azurerm_lb" "load_balancer" {
	name						= "$(var.prefix)-lb"
	location					= azurerm_resource_group.main.location
	resource_group_name	= azurerm_resource_group.main.name
	
	frontend_ip_configuration {
		name                 = "$(var.prefix)-PublicIP"
		public_ip_address_id = azurerm_public_ip.public_ip.id
	}
	
	tags = {
		lesson = 1
	}
}

# Not sure what the backended address pool does
resource "azurerm_lb_backend_address_pool" "main" {
	name                = "${var.prefix}-bap"
	resource_group_name = azurerm_resource_group.main.name
	loadbalancer_id     = azurerm_lb.load_balancer.id
	
	tags = {
		lesson = 1
	}
}


# the image we are using from packer
data "azurerm_image" "packer_image" {
	name                = "udacity-server-image"
	resource_group_name = var.packer_image
}

resource "azurerm_linux_virtual_machine" "main" {
	name                            = "${var.prefix}-vm"
	resource_group_name             = azurerm_resource_group.main.name
	location                        = azurerm_resource_group.main.location
	size                            = "Standard_B1s"
	admin_username                  = "${var.username}"
	admin_password                  = "${var.password}"
	disable_password_authentication = false
	
	network_interface_ids = [
		azurerm_network_interface.main.id,
		azurerm_lb_backend_address_pool.id,
#		azurerm_network_interface.external.id,
	]
	
	source_image_id = data.azurerm_image.packer_image.id
	
	os_disk {
		storage_account_type = "Standard_LRS"
		caching              = "ReadWrite"
	}
	
	tags = {
		lesson = 1
	}
}
