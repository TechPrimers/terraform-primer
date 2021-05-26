# Modules
Modules are used to structure the terraform configs and to reuse configurations
- `variables.tf` - has the variables used in the `main.tf`
- `main.tf` - has the resources and data source configurations
- `outputs.tf` - has all the outputs of the current module (which can be leveraged by other modules)
- `terraform init` will help in initializing modules.