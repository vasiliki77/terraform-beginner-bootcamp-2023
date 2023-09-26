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

We use the -var-file flag when we run Terraform commands like terraform apply or terraform plan and we can use the -var-file flag to specify this external variable file:
```
terraform apply -var-file=myvariables.tfvars
```
Terraform will then load the variable values from the specified file, and we can use them in our configuration.

### terraform.tfvars

This is the default file to load in terraform variables in blunk

### auto.tfvars

`auto.tfvars` is a special filename for a variable file that Terraform automatically loads if it exists in the same directory as our Terraform configuration files. This file is typically used to set default values for variables without requiring users to specify them on the command line or in a separate variable file explicitly.
Using `auto.tfvars` can make it more convenient to provide default values for variables in our Terraform project, especially when we expect users to commonly use certain values. However, it's important to note that values in auto.tfvars are still subject to being overridden by more specific variable definitions in other files or through command-line arguments, allowing for flexibility in configuration.

### order of terraform variables

In Terraform, when we define variables, they can be set and overridden in various ways. The order of precedence for Terraform variables, from highest to lowest, is as follows:

1. **Command-Line Flags**: Values specified using command-line flags take the highest precedence. For example:

```sh
terraform apply -var="my_variable=value"
```
2. **Variable Files (in order of appearance)**: Values specified in variable files are read in the order they are encountered. The last encountered value for a variable takes precedence. Variable files can be specified using the -var-file flag:

```sh
terraform apply -var-file=myvariables.tfvars
```
3. **Environment Variables**: Terraform variables can also be set using environment variables. Variables set in the environment take precedence over variable values set in variable files or the configuration. The naming convention for environment variables is `TF_VAR_<variable_name>`. For example:

```sh
export TF_VAR_my_variable=value
terraform apply
```
4. **Default Values in Configuration**: If none of the above methods provide a value for a variable, Terraform will use the default value defined in the configuration file where the variable is declared. For example:

```hcl
    variable "my_variable" {
      default = "default_value"
    }
```
5. **Implicit Variables**: Terraform also has a set of implicit variables that are available for use without being explicitly declared, such as `terraform.workspace`, `terraform.env`, and `terraform.timestamp`.

It's important to note that Terraform will use the value from the source with the highest precedence. If a variable is defined in multiple places, the value from the source with the highest precedence will be the one used.

Keep in mind that Terraform allows us to use different methods for flexibility and to manage configurations in different environments. However, it's a best practice to document and manage our variable values and sources to avoid unexpected behavior.
