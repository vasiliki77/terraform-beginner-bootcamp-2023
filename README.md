# Terraform Beginner Bootcamp 2023


### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)


[Getting started install aws CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

If it is succesful you should see a json payload return that looks like this:
```json
{
    "UserId": "AIDAASDFGHJKL",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```

We'll need to generate AWS CLI credits from IAM User in order to use the AWS CLI.

## Terraform Basics

### Terraform Registry

Terraform sources their providers and modules from the Terraform registry which is located at [registry.terraform.io](https://registry.terraform.io)

- **Providers** are a logical abstraction of an upstream API. They are responsible for understanding API interactions and exposing resources. 
- **Modules** are self-contained packages of Terraform configurations that are managed as a group. 

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random/latest)

### Terraform Console

We can see a list of all the Terraform commands by simply typing `terraform`

### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we will use in this project.

### Terraform Plan

`terraform plan`
This will generate a changeset, about the state of our infrastructure and what will be changed.
We can output this changeset to be passed to an apply, but often you can ignore outputting.

### Terrafrom Apply

`terraform apply`
This will run a plan and pass the changeset to be executed by terraform. Apply should prompt yes or no. 

If we want to automatically approve an apply, we can provide the auto approve flag.
`terraform apply --auto-approve`

### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The Terraform Lock File **should be commited** to your Version Control System(VCS)

### Terraform State Files

`.terraform.tfstate` contains information about the current state of your infrastructure.

This file **should not be committed** to your VCS.
This file can contain sensitive data. 
If you lose this file, you lose knowing the state of your infrastructure. 

`.terraform.tfstate.backup` is the previous state-file state.

### Terraform Directory

`.terraform` directory contains binaries of terraform providers.