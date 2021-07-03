# Lifecycle
Lifecycle is used for controlling creation and deletion of a specific resource
- `create_before_destroy` - used to inform terraform to create replacements and then delete old resource
- `prevent_destroy` - used to warn accidental deletion of resources
- `ignore_changes` - used to ignore changes done on the infrastructure which is not insync with the terraform script