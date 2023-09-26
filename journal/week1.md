# Terraform Beginner Bootcamp 2023 - Week1

## Root Module Structure

Our root module structure is as follows:
```
PROJECT_ROOT
|
├── main.tf            # everything else
├── variables.tf       # stores the structure of input variables
├── terraform.tfvars   # the data of variables we want to load into our terraform project
├── providers.tf       # defines required providers and their configuration
├── outputs.tf         # stores our outputs
└── README.md          # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Environment Variables - those you would set in your bash terminal eg. aws credentials
- Terraform Variables - those you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flat
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my-user-id"`

### var-file flag

- TODO

### terraform.tfvars

This is the default file to load in terraform variables in blunk

### auto.tfvars

- TODO

### order of terraform variables

- TODO which tf variables take precedence