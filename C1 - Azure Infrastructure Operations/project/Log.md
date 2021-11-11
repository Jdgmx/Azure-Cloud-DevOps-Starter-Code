# This files contains the steps that I've made to complete this project.

### Write a policy definition to deny the creation of resources that do not have tags
policies.json

Code to apply the policy
az policy definition create --name "Tagging-Policy" --display-name "Require Tagging Policy" --description "This policy requires everybody to have tags" --rules policies.json --mode All

Check: https://knowledge.udacity.com/questions/525456

Resulting output:

project  az policy definition create --name "Tagging-Policy" --display-name "Require Tagging Policy" --description "This policy requires everybody to have tags" --rules policies.json --mode All
{
  "description": "This policy requires everybody to have tags",
  "displayName": "Require Tagging Policy",
  "id": "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/providers/Microsoft.Authorization/policyDefinitions/Tagging-Policy",
  "metadata": {
	 "createdBy": "ae286afc-acf3-444b-b957-20cf56812b11",
	 "createdOn": "2021-11-01T17:30:38.7070887Z",
	 "updatedBy": "ae286afc-acf3-444b-b957-20cf56812b11",
	 "updatedOn": "2021-11-01T17:38:18.2693936Z"
  },
  "mode": "All",
  "name": "Tagging-Policy",
  "parameters": null,
  "policyRule": {
	 "if": {
		"exists": false,
		"field": "tags"
	 },
	 "then": {
		"effect": "deny"
	 }
  },
  "policyType": "Custom",
  "type": "Microsoft.Authorization/policyDefinitions"
}
project  az policy assignment list
[
  {
	 "description": null,
	 "displayName": null,
	 "enforcementMode": "Default",
	 "id": "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/providers/Microsoft.Authorization/policyAssignments/kmmBqAyCQBCcLeDeG8myuA",
	 "identity": null,
	 "location": null,
	 "metadata": {
		"createdBy": "ae286afc-acf3-444b-b957-20cf56812b11",
		"createdOn": "2021-10-25T16:50:34.2278326Z",
		"updatedBy": null,
		"updatedOn": null
	 },
	 "name": "kmmBqAyCQBCcLeDeG8myuA",
	 "nonComplianceMessages": null,
	 "notScopes": null,
	 "parameters": null,
	 "policyDefinitionId": "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/providers/Microsoft.Authorization/policyDefinitions/LinuxPasswordPolicy",
	 "scope": "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9",
	 "type": "Microsoft.Authorization/policyAssignments"
  },
  {
	 "description": "This is the default set of policies monitored by Azure Security Center. It was automatically assigned as part of onboarding to Security Center. The default assignment contains only audit policies. For more information please visit https://aka.ms/ascpolicies",
	 "displayName": "ASC Default (subscription: a05e9c22-474e-442c-8d07-d2b208778ef9)",
	 "enforcementMode": "Default",
	 "id": "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn",
	 "identity": null,
	 "location": null,
	 "metadata": {
		"assignedBy": "Security Center",
		"createdBy": "553df8bc-f67a-4149-b05a-9739f6cc8b15",
		"createdOn": "2021-10-22T17:19:00.5667885Z",
		"excludedOutOfTheBoxStandards": [
		  "PCI DSS 3.2.1",
		  "ISO 27001",
		  "SOC TSP"
		],
		"updatedBy": null,
		"updatedOn": null
	 },
	 "name": "SecurityCenterBuiltIn",
	 "nonComplianceMessages": null,
	 "notScopes": null,
	 "parameters": {},
	 "policyDefinitionId": "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8",
	 "scope": "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9",
	 "type": "Microsoft.Authorization/policyAssignments"
  }
]
project  



### Packer output

packer  packer build server.json
azure-arm: output will be in this color.

==> azure-arm: Running builder ...
==> azure-arm: Getting tokens using client secret
==> azure-arm: Getting tokens using client secret
	 azure-arm: Creating Azure Resource Manager (ARM) client ...
==> azure-arm: WARNING: Zone resiliency may not be supported in East US, checkout the docs at https://docs.microsoft.com/en-us/azure/availability-zones/
==> azure-arm: Getting source image id for the deployment ...
==> azure-arm:  -> SourceImageName: '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/providers/Microsoft.Compute/locations/East US/publishers/Canonical/ArtifactTypes/vmimage/offers/UbuntuServer/skus/18.04-LTS/versions/latest'
==> azure-arm: Creating resource group ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-lx9ss31abj'
==> azure-arm:  -> Location          : 'East US'
==> azure-arm:  -> Tags              :
==> azure-arm: Validating deployment template ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-lx9ss31abj'
==> azure-arm:  -> DeploymentName    : 'pkrdplx9ss31abj'
==> azure-arm: Deploying deployment template ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-lx9ss31abj'
==> azure-arm:  -> DeploymentName    : 'pkrdplx9ss31abj'
==> azure-arm:
==> azure-arm: Getting the VM's IP address ...
==> azure-arm:  -> ResourceGroupName   : 'pkr-Resource-Group-lx9ss31abj'
==> azure-arm:  -> PublicIPAddressName : 'pkriplx9ss31abj'
==> azure-arm:  -> NicName             : 'pkrnilx9ss31abj'
==> azure-arm:  -> Network Connection  : 'PublicEndpoint'
==> azure-arm:  -> IP Address          : '20.115.33.88'
==> azure-arm: Waiting for SSH to become available...
==> azure-arm: Connected to SSH!
==> azure-arm: Provisioning with shell script: /var/folders/nd/j5st0_411qj53nymq58bst640000gn/T/packer-shell411200464
==> azure-arm: + echo Hello, World!
==> azure-arm: Querying the machine's properties ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-lx9ss31abj'
==> azure-arm:  -> ComputeName       : 'pkrvmlx9ss31abj'
==> azure-arm:  -> Managed OS Disk   : '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-lx9ss31abj/providers/Microsoft.Compute/disks/pkroslx9ss31abj'
==> azure-arm: Querying the machine's additional disks properties ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-lx9ss31abj'
==> azure-arm:  -> ComputeName       : 'pkrvmlx9ss31abj'
==> azure-arm: Powering off machine ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-lx9ss31abj'
==> azure-arm:  -> ComputeName       : 'pkrvmlx9ss31abj'
==> azure-arm: Capturing image ...
==> azure-arm:  -> Compute ResourceGroupName : 'pkr-Resource-Group-lx9ss31abj'
==> azure-arm:  -> Compute Name              : 'pkrvmlx9ss31abj'
==> azure-arm:  -> Compute Location          : 'East US'
==> azure-arm:  -> Image ResourceGroupName   : 'WebServerEx-rg'
==> azure-arm:  -> Image Name                : 'myWebServerImage'
==> azure-arm:  -> Image Location            : 'East US'
==> azure-arm: 
==> azure-arm: Deleting individual resources ...
==> azure-arm: Adding to deletion queue -> Microsoft.Compute/virtualMachines : 'pkrvmlx9ss31abj'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/networkInterfaces : 'pkrnilx9ss31abj'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/virtualNetworks : 'pkrvnlx9ss31abj'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/publicIPAddresses : 'pkriplx9ss31abj'
==> azure-arm: Waiting for deletion of all resources...
==> azure-arm: Attempting deletion -> Microsoft.Network/networkInterfaces : 'pkrnilx9ss31abj'
==> azure-arm: Attempting deletion -> Microsoft.Compute/virtualMachines : 'pkrvmlx9ss31abj'
==> azure-arm: Attempting deletion -> Microsoft.Network/virtualNetworks : 'pkrvnlx9ss31abj'
==> azure-arm: Attempting deletion -> Microsoft.Network/publicIPAddresses : 'pkriplx9ss31abj'
==> azure-arm: Error deleting resource. Will retry.
==> azure-arm: Name: pkriplx9ss31abj
==> azure-arm: Error: network.PublicIPAddressesClient#Delete: Failure sending request: StatusCode=0 -- Original Error: Code="PublicIPAddressCannotBeDeleted" Message="Public IP address /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-lx9ss31abj/providers/Microsoft.Network/publicIPAddresses/pkriplx9ss31abj can not be deleted since it is still allocated to resource /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-lx9ss31abj/providers/Microsoft.Network/networkInterfaces/pkrnilx9ss31abj/ipConfigurations/ipconfig. In order to delete the public IP, disassociate/detach the Public IP address from the resource.  To learn how to do this, see aka.ms/deletepublicip." Details=[]
==> azure-arm:
==> azure-arm: Error deleting resource. Will retry.
==> azure-arm: Name: pkrvnlx9ss31abj
==> azure-arm: Error: network.VirtualNetworksClient#Delete: Failure sending request: StatusCode=0 -- Original Error: Code="InUseSubnetCannotBeDeleted" Message="Subnet pkrsnlx9ss31abj is in use by /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-lx9ss31abj/providers/Microsoft.Network/networkInterfaces/pkrnilx9ss31abj/ipConfigurations/ipconfig and cannot be deleted. In order to delete the subnet, delete all the resources within the subnet. See aka.ms/deletesubnet." Details=[]
==> azure-arm:
==> azure-arm: Attempting deletion -> Microsoft.Network/publicIPAddresses : 'pkriplx9ss31abj'
==> azure-arm: Attempting deletion -> Microsoft.Network/virtualNetworks : 'pkrvnlx9ss31abj'
==> azure-arm:  Deleting -> Microsoft.Compute/disks : '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-lx9ss31abj/providers/Microsoft.Compute/disks/pkroslx9ss31abj'
==> azure-arm: Removing the created Deployment object: 'pkrdplx9ss31abj'
==> azure-arm: 
==> azure-arm: Cleanup requested, deleting resource group ...
==> azure-arm: Resource group has been deleted.
Build 'azure-arm' finished after 3 minutes 46 seconds.

==> Wait completed after 3 minutes 46 seconds

==> Builds finished. The artifacts of successful builds are:
--> azure-arm: Azure.ResourceManagement.VMImage:

OSType: Linux
ManagedImageResourceGroupName: WebServerEx-rg
ManagedImageName: myWebServerImage
ManagedImageId: /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/WebServerEx-rg/providers/Microsoft.Compute/images/myWebServerImage
ManagedImageLocation: East US


references:
https://github.com/rfoltz/Udacity-DevOps-Project-1/blob/main/Terraform/main.tf
https://github.com/rfoltz/Udacity-DevOps-Project-1/blob/main/Terraform/vars.tf
http://vcloud-lab.com/entries/microsoft-azure/create-an-azure-virtual-machine-scale-set-and-load-balancer-using-terraform



# Another Packer output (again)

packer  packer build -force server.json 
azure-arm: output will be in this color.

==> azure-arm: Running builder ...
==> azure-arm: Getting tokens using client secret
==> azure-arm: Getting tokens using client secret
	 azure-arm: Creating Azure Resource Manager (ARM) client ...
==> azure-arm: the managed image named myWebServerImage already exists, but deleting it due to -force flag
==> azure-arm: WARNING: Zone resiliency may not be supported in East US, checkout the docs at https://docs.microsoft.com/en-us/azure/availability-zones/
==> azure-arm: Getting source image id for the deployment ...
==> azure-arm:  -> SourceImageName: '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/providers/Microsoft.Compute/locations/East US/publishers/Canonical/ArtifactTypes/vmimage/offers/UbuntuServer/skus/18.04-LTS/versions/latest'
==> azure-arm: Creating resource group ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-nx2xgsa0s0'
==> azure-arm:  -> Location          : 'East US'
==> azure-arm:  -> Tags              :
==> azure-arm: Validating deployment template ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-nx2xgsa0s0'
==> azure-arm:  -> DeploymentName    : 'pkrdpnx2xgsa0s0'
==> azure-arm: Deploying deployment template ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-nx2xgsa0s0'
==> azure-arm:  -> DeploymentName    : 'pkrdpnx2xgsa0s0'
==> azure-arm:
==> azure-arm: Getting the VM's IP address ...
==> azure-arm:  -> ResourceGroupName   : 'pkr-Resource-Group-nx2xgsa0s0'
==> azure-arm:  -> PublicIPAddressName : 'pkripnx2xgsa0s0'
==> azure-arm:  -> NicName             : 'pkrninx2xgsa0s0'
==> azure-arm:  -> Network Connection  : 'PublicEndpoint'
==> azure-arm:  -> IP Address          : '52.170.159.3'
==> azure-arm: Waiting for SSH to become available...
==> azure-arm: Connected to SSH!
==> azure-arm: Provisioning with shell script: /var/folders/nd/j5st0_411qj53nymq58bst640000gn/T/packer-shell3635259174
==> azure-arm: + echo Hello, World!
==> azure-arm: + nohup busybox httpd -f -p 80
==> azure-arm: Querying the machine's properties ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-nx2xgsa0s0'
==> azure-arm:  -> ComputeName       : 'pkrvmnx2xgsa0s0'
==> azure-arm:  -> Managed OS Disk   : '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-nx2xgsa0s0/providers/Microsoft.Compute/disks/pkrosnx2xgsa0s0'
==> azure-arm: Querying the machine's additional disks properties ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-nx2xgsa0s0'
==> azure-arm:  -> ComputeName       : 'pkrvmnx2xgsa0s0'
==> azure-arm: Powering off machine ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-nx2xgsa0s0'
==> azure-arm:  -> ComputeName       : 'pkrvmnx2xgsa0s0'
==> azure-arm: Capturing image ...
==> azure-arm:  -> Compute ResourceGroupName : 'pkr-Resource-Group-nx2xgsa0s0'
==> azure-arm:  -> Compute Name              : 'pkrvmnx2xgsa0s0'
==> azure-arm:  -> Compute Location          : 'East US'
==> azure-arm:  -> Image ResourceGroupName   : 'WebServerEx-rg'
==> azure-arm:  -> Image Name                : 'myWebServerImage'
==> azure-arm:  -> Image Location            : 'East US'
==> azure-arm: 
==> azure-arm: Deleting individual resources ...
==> azure-arm: Adding to deletion queue -> Microsoft.Compute/virtualMachines : 'pkrvmnx2xgsa0s0'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/networkInterfaces : 'pkrninx2xgsa0s0'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/virtualNetworks : 'pkrvnnx2xgsa0s0'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/publicIPAddresses : 'pkripnx2xgsa0s0'
==> azure-arm: Waiting for deletion of all resources...
==> azure-arm: Attempting deletion -> Microsoft.Compute/virtualMachines : 'pkrvmnx2xgsa0s0'
==> azure-arm: Attempting deletion -> Microsoft.Network/publicIPAddresses : 'pkripnx2xgsa0s0'
==> azure-arm: Attempting deletion -> Microsoft.Network/networkInterfaces : 'pkrninx2xgsa0s0'
==> azure-arm: Attempting deletion -> Microsoft.Network/virtualNetworks : 'pkrvnnx2xgsa0s0'
==> azure-arm: Error deleting resource. Will retry.
==> azure-arm: Name: pkripnx2xgsa0s0
==> azure-arm: Error: network.PublicIPAddressesClient#Delete: Failure sending request: StatusCode=0 -- Original Error: Code="PublicIPAddressCannotBeDeleted" Message="Public IP address /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-nx2xgsa0s0/providers/Microsoft.Network/publicIPAddresses/pkripnx2xgsa0s0 can not be deleted since it is still allocated to resource /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-nx2xgsa0s0/providers/Microsoft.Network/networkInterfaces/pkrninx2xgsa0s0/ipConfigurations/ipconfig. In order to delete the public IP, disassociate/detach the Public IP address from the resource.  To learn how to do this, see aka.ms/deletepublicip." Details=[]
==> azure-arm:
==> azure-arm: Error deleting resource. Will retry.
==> azure-arm: Name: pkrvnnx2xgsa0s0
==> azure-arm: Error: network.VirtualNetworksClient#Delete: Failure sending request: StatusCode=0 -- Original Error: Code="InUseSubnetCannotBeDeleted" Message="Subnet pkrsnnx2xgsa0s0 is in use by /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-nx2xgsa0s0/providers/Microsoft.Network/networkInterfaces/pkrninx2xgsa0s0/ipConfigurations/ipconfig and cannot be deleted. In order to delete the subnet, delete all the resources within the subnet. See aka.ms/deletesubnet." Details=[]
==> azure-arm:
==> azure-arm: Attempting deletion -> Microsoft.Network/publicIPAddresses : 'pkripnx2xgsa0s0'
==> azure-arm: Attempting deletion -> Microsoft.Network/virtualNetworks : 'pkrvnnx2xgsa0s0'
==> azure-arm:  Deleting -> Microsoft.Compute/disks : '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-nx2xgsa0s0/providers/Microsoft.Compute/disks/pkrosnx2xgsa0s0'
==> azure-arm: Removing the created Deployment object: 'pkrdpnx2xgsa0s0'
==> azure-arm: 
==> azure-arm: Cleanup requested, deleting resource group ...
==> azure-arm: Resource group has been deleted.
Build 'azure-arm' finished after 7 minutes 46 seconds.

==> Wait completed after 7 minutes 46 seconds

==> Builds finished. The artifacts of successful builds are:
--> azure-arm: Azure.ResourceManagement.VMImage:

OSType: Linux
ManagedImageResourceGroupName: WebServerEx-rg
ManagedImageName: myWebServerImage
ManagedImageId: /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/WebServerEx-rg/providers/Microsoft.Compute/images/myWebServerImage
ManagedImageLocation: East US

packer  


# Terraform plan

tf  terraform plan -out solution.plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # data.azurerm_image.packer_image will be read during apply
  # (config refers to values not yet known)
 <= data "azurerm_image" "packer_image"  {
		+ data_disk           = (known after apply)
		+ id                  = (known after apply)
		+ location            = (known after apply)
		+ name                = "myWebServerImage"
		+ os_disk             = (known after apply)
		+ resource_group_name = "WebServerEx-rg"
		+ tags                = (known after apply)
		+ zone_resilient      = (known after apply)

		+ timeouts {
			 + read = (known after apply)
		  }
	 }

  # azurerm_availability_set.avail_set will be created
  + resource "azurerm_availability_set" "avail_set" {
		+ id                           = (known after apply)
		+ location                     = "eastus"
		+ managed                      = true
		+ name                         = "WebServerEx-avaset"
		+ platform_fault_domain_count  = 3
		+ platform_update_domain_count = 5
		+ resource_group_name          = "WebServerEx-rg"
		+ tags                         = {
			 + "lesson" = "1"
		  }
	 }

  # azurerm_lb.load_balancer will be created
  + resource "azurerm_lb" "load_balancer" {
		+ id                   = (known after apply)
		+ location             = "eastus"
		+ name                 = "$(var.prefix)-lb"
		+ private_ip_address   = (known after apply)
		+ private_ip_addresses = (known after apply)
		+ resource_group_name  = "WebServerEx-rg"
		+ sku                  = "Basic"
		+ sku_tier             = "Regional"
		+ tags                 = {
			 + "lesson" = "1"
		  }

		+ frontend_ip_configuration {
			 + availability_zone                                  = (known after apply)
			 + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
			 + id                                                 = (known after apply)
			 + inbound_nat_rules                                  = (known after apply)
			 + load_balancer_rules                                = (known after apply)
			 + name                                               = "$(var.prefix)-PublicIP"
			 + outbound_rules                                     = (known after apply)
			 + private_ip_address                                 = (known after apply)
			 + private_ip_address_allocation                      = (known after apply)
			 + private_ip_address_version                         = (known after apply)
			 + public_ip_address_id                               = (known after apply)
			 + public_ip_prefix_id                                = (known after apply)
			 + subnet_id                                          = (known after apply)
			 + zones                                              = (known after apply)
		  }
	 }

  # azurerm_lb_backend_address_pool.address_pool will be created
  + resource "azurerm_lb_backend_address_pool" "address_pool" {
		+ backend_ip_configurations = (known after apply)
		+ id                        = (known after apply)
		+ load_balancing_rules      = (known after apply)
		+ loadbalancer_id           = (known after apply)
		+ name                      = "WebServerEx-bap"
		+ outbound_rules            = (known after apply)
		+ resource_group_name       = (known after apply)
	 }

  # azurerm_linux_virtual_machine.vm[0] will be created
  + resource "azurerm_linux_virtual_machine" "vm" {
		+ admin_password                  = (sensitive value)
		+ admin_username                  = "joaquin.d"
		+ allow_extension_operations      = true
		+ availability_set_id             = (known after apply)
		+ computer_name                   = (known after apply)
		+ disable_password_authentication = false
		+ extensions_time_budget          = "PT1H30M"
		+ id                              = (known after apply)
		+ location                        = "eastus"
		+ max_bid_price                   = -1
		+ name                            = "WebServerEx-vm-0"
		+ network_interface_ids           = (known after apply)
		+ platform_fault_domain           = -1
		+ priority                        = "Regular"
		+ private_ip_address              = (known after apply)
		+ private_ip_addresses            = (known after apply)
		+ provision_vm_agent              = true
		+ public_ip_address               = (known after apply)
		+ public_ip_addresses             = (known after apply)
		+ resource_group_name             = "WebServerEx-rg"
		+ size                            = "Standard_B1s"
		+ source_image_id                 = (known after apply)
		+ tags                            = {
			 + "lesson" = "1"
		  }
		+ virtual_machine_id              = (known after apply)
		+ zone                            = (known after apply)

		+ os_disk {
			 + caching                   = "ReadWrite"
			 + disk_size_gb              = (known after apply)
			 + name                      = (known after apply)
			 + storage_account_type      = "Standard_LRS"
			 + write_accelerator_enabled = false
		  }
	 }

  # azurerm_managed_disk.disk[0] will be created
  + resource "azurerm_managed_disk" "disk" {
		+ create_option        = "Empty"
		+ disk_iops_read_write = (known after apply)
		+ disk_mbps_read_write = (known after apply)
		+ disk_size_gb         = 1
		+ id                   = (known after apply)
		+ location             = "eastus"
		+ logical_sector_size  = (known after apply)
		+ max_shares           = (known after apply)
		+ name                 = "WebServerEx-disk-0"
		+ resource_group_name  = "WebServerEx-rg"
		+ source_uri           = (known after apply)
		+ storage_account_type = "Standard_LRS"
		+ tags                 = {
			 + "lesson" = "1"
		  }
		+ tier                 = (known after apply)
	 }

  # azurerm_network_interface.internal[0] will be created
  + resource "azurerm_network_interface" "internal" {
		+ applied_dns_servers           = (known after apply)
		+ dns_servers                   = (known after apply)
		+ enable_accelerated_networking = false
		+ enable_ip_forwarding          = false
		+ id                            = (known after apply)
		+ internal_dns_name_label       = (known after apply)
		+ internal_domain_name_suffix   = (known after apply)
		+ location                      = "eastus"
		+ mac_address                   = (known after apply)
		+ name                          = "WebServerEx-nic_int-0"
		+ private_ip_address            = (known after apply)
		+ private_ip_addresses          = (known after apply)
		+ resource_group_name           = "WebServerEx-rg"
		+ tags                          = {
			 + "lesson" = "1"
		  }
		+ virtual_machine_id            = (known after apply)

		+ ip_configuration {
			 + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
			 + name                                               = "internal"
			 + primary                                            = (known after apply)
			 + private_ip_address                                 = (known after apply)
			 + private_ip_address_allocation                      = "dynamic"
			 + private_ip_address_version                         = "IPv4"
			 + subnet_id                                          = (known after apply)
		  }
	 }

  # azurerm_network_interface_backend_address_pool_association.pool_assoc[0] will be created
  + resource "azurerm_network_interface_backend_address_pool_association" "pool_assoc" {
		+ backend_address_pool_id = (known after apply)
		+ id                      = (known after apply)
		+ ip_configuration_name   = "internal"
		+ network_interface_id    = (known after apply)
	 }

  # azurerm_network_security_group.security will be created
  + resource "azurerm_network_security_group" "security" {
		+ id                  = (known after apply)
		+ location            = "eastus"
		+ name                = "WebServerEx-sg"
		+ resource_group_name = "WebServerEx-rg"
		+ security_rule       = [
			 + {
				  + access                                     = "Allow"
				  + description                                = ""
				  + destination_address_prefix                 = "VirtualNetwork"
				  + destination_address_prefixes               = []
				  + destination_application_security_group_ids = []
				  + destination_port_range                     = "*"
				  + destination_port_ranges                    = []
				  + direction                                  = "Inbound"
				  + name                                       = "VMAccess"
				  + priority                                   = 200
				  + protocol                                   = "*"
				  + source_address_prefix                      = "VirtualNetwork"
				  + source_address_prefixes                    = []
				  + source_application_security_group_ids      = []
				  + source_port_range                          = "*"
				  + source_port_ranges                         = []
				},
			 + {
				  + access                                     = "Deny"
				  + description                                = ""
				  + destination_address_prefix                 = "*"
				  + destination_address_prefixes               = []
				  + destination_application_security_group_ids = []
				  + destination_port_range                     = "*"
				  + destination_port_ranges                    = []
				  + direction                                  = "Inbound"
				  + name                                       = "NoInternetIn"
				  + priority                                   = 100
				  + protocol                                   = "*"
				  + source_address_prefix                      = "*"
				  + source_address_prefixes                    = []
				  + source_application_security_group_ids      = []
				  + source_port_range                          = "*"
				  + source_port_ranges                         = []
				},
		  ]
		+ tags                = {
			 + "lesson" = "1"
		  }
	 }

  # azurerm_public_ip.public_ip will be created
  + resource "azurerm_public_ip" "public_ip" {
		+ allocation_method       = "Static"
		+ availability_zone       = (known after apply)
		+ fqdn                    = (known after apply)
		+ id                      = (known after apply)
		+ idle_timeout_in_minutes = 4
		+ ip_address              = (known after apply)
		+ ip_version              = "IPv4"
		+ location                = "eastus"
		+ name                    = "WebServerEx-publicIp"
		+ resource_group_name     = "WebServerEx-rg"
		+ sku                     = "Basic"
		+ sku_tier                = "Regional"
		+ tags                    = {
			 + "lesson" = "1"
		  }
		+ zones                   = (known after apply)
	 }

  # azurerm_resource_group.main will be created
  + resource "azurerm_resource_group" "main" {
		+ id       = (known after apply)
		+ location = "eastus"
		+ name     = "WebServerEx-rg"
	 }

  # azurerm_subnet.internal will be created
  + resource "azurerm_subnet" "internal" {
		+ address_prefix                                 = (known after apply)
		+ address_prefixes                               = [
			 + "10.0.2.0/24",
		  ]
		+ enforce_private_link_endpoint_network_policies = false
		+ enforce_private_link_service_network_policies  = false
		+ id                                             = (known after apply)
		+ name                                           = "internal"
		+ resource_group_name                            = "WebServerEx-rg"
		+ virtual_network_name                           = "WebServerEx-network"
	 }

  # azurerm_subnet_network_security_group_association.main will be created
  + resource "azurerm_subnet_network_security_group_association" "main" {
		+ id                        = (known after apply)
		+ network_security_group_id = (known after apply)
		+ subnet_id                 = (known after apply)
	 }

  # azurerm_virtual_machine_data_disk_attachment.mount_disk[0] will be created
  + resource "azurerm_virtual_machine_data_disk_attachment" "mount_disk" {
		+ caching                   = "ReadWrite"
		+ create_option             = "Attach"
		+ id                        = (known after apply)
		+ lun                       = 0
		+ managed_disk_id           = (known after apply)
		+ virtual_machine_id        = (known after apply)
		+ write_accelerator_enabled = false
	 }

  # azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
		+ address_space         = [
			 + "10.0.2.0/24",
		  ]
		+ dns_servers           = (known after apply)
		+ guid                  = (known after apply)
		+ id                    = (known after apply)
		+ location              = "eastus"
		+ name                  = "WebServerEx-network"
		+ resource_group_name   = "WebServerEx-rg"
		+ subnet                = (known after apply)
		+ vm_protection_enabled = false
	 }

Plan: 14 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: solution.plan

To perform exactly these actions, run the following command to apply:
	 terraform apply "solution.plan"


# Terraform Apply


tf  terraform apply "solution.plan"  
azurerm_resource_group.main: Creating...
╷
│ Error: A resource with the ID "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/WebServerEx-rg" already exists - to be managed via Terraform this resource needs to be imported into the State. Please see the resource documentation for "azurerm_resource_group" for more information.
│ 
│   with azurerm_resource_group.main,
│   on main.tf line 6, in resource "azurerm_resource_group" "main":
│    6: resource "azurerm_resource_group" "main" {
│ 
╵

# had to:

tf  terraform import azurerm_resource_group.main /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/WebServerEx-rg
azurerm_resource_group.main: Importing from ID "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/WebServerEx-rg"...
azurerm_resource_group.main: Import prepared!
  Prepared azurerm_resource_group for import
azurerm_resource_group.main: Refreshing state... [id=/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/WebServerEx-rg]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.


# Terraform Apply again

tf  terraform apply "solution.plan"
azurerm_resource_group.main: Creating...
╷
│ Error: A resource with the ID "/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/WebServerEx-rg" already exists - to be managed via Terraform this resource needs to be imported into the State. Please see the resource documentation for "azurerm_resource_group" for more information.
│ 
│   with azurerm_resource_group.main,
│   on main.tf line 6, in resource "azurerm_resource_group" "main":
│    6: resource "azurerm_resource_group" "main" {
│ 
╵

# plan again

tf  terraform plan -out solution.plan

###################################################################
# SARTING EVERYTHING ALL OVER AGAIN	

Lesson: The packer image has to be in a different Resourve Group an that has to be in the files.

### Packer output

packer  packer build server.json
azure-arm: output will be in this color.

==> azure-arm: Running builder ...
==> azure-arm: Getting tokens using client secret
==> azure-arm: Getting tokens using client secret
	 azure-arm: Creating Azure Resource Manager (ARM) client ...
==> azure-arm: WARNING: Zone resiliency may not be supported in East US, checkout the docs at https://docs.microsoft.com/en-us/azure/availability-zones/
==> azure-arm: Getting source image id for the deployment ...
==> azure-arm:  -> SourceImageName: '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/providers/Microsoft.Compute/locations/East US/publishers/Canonical/ArtifactTypes/vmimage/offers/UbuntuServer/skus/18.04-LTS/versions/latest'
==> azure-arm: Creating resource group ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-2n285ewpkm'
==> azure-arm:  -> Location          : 'East US'
==> azure-arm:  -> Tags              :
==> azure-arm: Validating deployment template ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-2n285ewpkm'
==> azure-arm:  -> DeploymentName    : 'pkrdp2n285ewpkm'
==> azure-arm: Deploying deployment template ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-2n285ewpkm'
==> azure-arm:  -> DeploymentName    : 'pkrdp2n285ewpkm'
==> azure-arm:
==> azure-arm: Getting the VM's IP address ...
==> azure-arm:  -> ResourceGroupName   : 'pkr-Resource-Group-2n285ewpkm'
==> azure-arm:  -> PublicIPAddressName : 'pkrip2n285ewpkm'
==> azure-arm:  -> NicName             : 'pkrni2n285ewpkm'
==> azure-arm:  -> Network Connection  : 'PublicEndpoint'
==> azure-arm:  -> IP Address          : '20.120.95.131'
==> azure-arm: Waiting for SSH to become available...
==> azure-arm: Connected to SSH!
==> azure-arm: Provisioning with shell script: /var/folders/nd/j5st0_411qj53nymq58bst640000gn/T/packer-shell287799332
==> azure-arm: + echo Hello, World!
==> azure-arm: + nohup busybox httpd -f -p 80
==> azure-arm: Querying the machine's properties ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-2n285ewpkm'
==> azure-arm:  -> ComputeName       : 'pkrvm2n285ewpkm'
==> azure-arm:  -> Managed OS Disk   : '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-2n285ewpkm/providers/Microsoft.Compute/disks/pkros2n285ewpkm'
==> azure-arm: Querying the machine's additional disks properties ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-2n285ewpkm'
==> azure-arm:  -> ComputeName       : 'pkrvm2n285ewpkm'
==> azure-arm: Powering off machine ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-2n285ewpkm'
==> azure-arm:  -> ComputeName       : 'pkrvm2n285ewpkm'
==> azure-arm: Capturing image ...
==> azure-arm:  -> Compute ResourceGroupName : 'pkr-Resource-Group-2n285ewpkm'
==> azure-arm:  -> Compute Name              : 'pkrvm2n285ewpkm'
==> azure-arm:  -> Compute Location          : 'East US'
==> azure-arm:  -> Image ResourceGroupName   : 'PackerImage-rg'
==> azure-arm:  -> Image Name                : 'WebServerImage'
==> azure-arm:  -> Image Location            : 'East US'
==> azure-arm: 
==> azure-arm: Deleting individual resources ...
==> azure-arm: Adding to deletion queue -> Microsoft.Compute/virtualMachines : 'pkrvm2n285ewpkm'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/networkInterfaces : 'pkrni2n285ewpkm'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/virtualNetworks : 'pkrvn2n285ewpkm'
==> azure-arm: Adding to deletion queue -> Microsoft.Network/publicIPAddresses : 'pkrip2n285ewpkm'
==> azure-arm: Waiting for deletion of all resources...
==> azure-arm: Attempting deletion -> Microsoft.Network/virtualNetworks : 'pkrvn2n285ewpkm'
==> azure-arm: Attempting deletion -> Microsoft.Network/publicIPAddresses : 'pkrip2n285ewpkm'
==> azure-arm: Attempting deletion -> Microsoft.Compute/virtualMachines : 'pkrvm2n285ewpkm'
==> azure-arm: Attempting deletion -> Microsoft.Network/networkInterfaces : 'pkrni2n285ewpkm'
==> azure-arm: Error deleting resource. Will retry.
==> azure-arm: Name: pkrip2n285ewpkm
==> azure-arm: Error: network.PublicIPAddressesClient#Delete: Failure sending request: StatusCode=0 -- Original Error: Code="PublicIPAddressCannotBeDeleted" Message="Public IP address /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-2n285ewpkm/providers/Microsoft.Network/publicIPAddresses/pkrip2n285ewpkm can not be deleted since it is still allocated to resource /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-2n285ewpkm/providers/Microsoft.Network/networkInterfaces/pkrni2n285ewpkm/ipConfigurations/ipconfig. In order to delete the public IP, disassociate/detach the Public IP address from the resource.  To learn how to do this, see aka.ms/deletepublicip." Details=[]
==> azure-arm:
==> azure-arm: Error deleting resource. Will retry.
==> azure-arm: Name: pkrvn2n285ewpkm
==> azure-arm: Error: network.VirtualNetworksClient#Delete: Failure sending request: StatusCode=0 -- Original Error: Code="InUseSubnetCannotBeDeleted" Message="Subnet pkrsn2n285ewpkm is in use by /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-2n285ewpkm/providers/Microsoft.Network/networkInterfaces/pkrni2n285ewpkm/ipConfigurations/ipconfig and cannot be deleted. In order to delete the subnet, delete all the resources within the subnet. See aka.ms/deletesubnet." Details=[]
==> azure-arm:
==> azure-arm: Attempting deletion -> Microsoft.Network/publicIPAddresses : 'pkrip2n285ewpkm'
==> azure-arm: Attempting deletion -> Microsoft.Network/virtualNetworks : 'pkrvn2n285ewpkm'
==> azure-arm:  Deleting -> Microsoft.Compute/disks : '/subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/pkr-Resource-Group-2n285ewpkm/providers/Microsoft.Compute/disks/pkros2n285ewpkm'
==> azure-arm: Removing the created Deployment object: 'pkrdp2n285ewpkm'
==> azure-arm: 
==> azure-arm: Cleanup requested, deleting resource group ...
==> azure-arm: Resource group has been deleted.
Build 'azure-arm' finished after 5 minutes 23 seconds.

==> Wait completed after 5 minutes 23 seconds

==> Builds finished. The artifacts of successful builds are:
--> azure-arm: Azure.ResourceManagement.VMImage:

OSType: Linux
ManagedImageResourceGroupName: PackerImage-rg
ManagedImageName: WebServerImage
ManagedImageId: /subscriptions/a05e9c22-474e-442c-8d07-d2b208778ef9/resourceGroups/PackerImage-rg/providers/Microsoft.Compute/images/WebServerImage
ManagedImageLocation: East US










