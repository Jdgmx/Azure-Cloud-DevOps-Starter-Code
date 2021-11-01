# This files contains the steps that I've made to complete this project.

### Write a policy definition to deny the creation of resources that do not have tags
policies.json

Code to apply the policy
az policy definition create --name "Tagging-Policy" --display-name "Require Tagging Policy" --description "This policy requires everybody to have tags" --rules policies.json --mode All

Check: https://knowledge.udacity.com/questions/525456

