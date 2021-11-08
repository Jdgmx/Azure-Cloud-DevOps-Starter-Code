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
