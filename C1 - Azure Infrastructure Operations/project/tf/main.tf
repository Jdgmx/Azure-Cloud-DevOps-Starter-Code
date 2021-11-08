provider "azurerm" {
	features { }
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "main" {
	name                = "${var.prefix}-network"
	address_space       = ["10.0.2.0/24"]
	location            = azurerm_resource_group.main.location
	resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "internal" {
	name                 = "internal"
	resource_group_name  = azurerm_resource_group.main.name
	virtual_network_name = azurerm_virtual_network.main.name
	address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "security" {
	name                = "${var.prefix}-sg""
	location            = azurerm_resource_group.main.location
	resource_group_name = azurerm_resource_group.main.name

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

resource "azurerm_public_ip" "public_ip" {
	name                = "${var.prefix}-publicIp"
	resource_group_name = azurerm_resource_group.main.name
	location            = azurerm_resource_group.main.location
	allocation_method   = "Dynamic"
	sku                 = "Basic"
}

resource "azurerm_network_interface" "internal" {
	name                = "${var.prefix}-nic-int"
	resource_group_name = azurerm_resource_group.main.name
	location            = azurerm_resource_group.main.location
	
	ip_configuration {
		name                          = "internal"
		subnet_id                     = azurerm_subnet.internal.id
		private_ip_address_allocation = "Dynamic"
	}
}

resource "azurerm_network_interface" "external" {
	name                = "${var.prefix}-nic-ext"
	resource_group_name = azurerm_resource_group.main.name
	location            = azurerm_resource_group.main.location
	
	ip_configuration {
		name                          = "external"
		subnet_id                     = azurerm_subnet.internal.id
		private_ip_address_allocation = "Dynamic"
		public_ip_address_id          = azurerm_public_ip.public_ip.id
	}
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
		azurerm_network_interface.external.id,
	]
	
	source_image_reference {
		publisher = "Canonical"
		offer     = "UbuntuServer"
		sku       = "18.04-LTS"
		version   = "latest"
	}
	
	os_disk {
		storage_account_type = "Standard_LRS"
		caching              = "ReadWrite"
	}
}


