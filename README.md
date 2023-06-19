# terraform-aws

This repo was created for practicing the orchestration of AWS with Terraform

## notes

### Useful commands
- `terraform init` -> sets up the terraform directory once a main.tf file has been created
- `terraform plan` -> dry run of what will happen if the terraform config is applied
  - `terraform plan -out bob.file` allows you to save the particular plan state so it can be applied verbatim later
- `terraform apply` -> applies the terraform state as currently present in the directory
  - `terraform apply "bob.file` allows you to apply a saved terraform plan
- `terraform fmt` -> formats the terraform files in the directory
- `terraform validate` -> verifies that the terraform files are valid
