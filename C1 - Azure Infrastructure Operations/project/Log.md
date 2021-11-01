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
