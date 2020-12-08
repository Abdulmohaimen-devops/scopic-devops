# Scopic-devops
## Intro

This is my SCOPIC DevOps Test project. In this project I created an IAC on AWS by using terraform.

## Install

To be able to use projecte we will need:
- Terraform
- AWS Account
- AWS IAM User with Administrator Permission

### 1. Launch TF Script through the following commands:
 ```
terraform init
terraform validate
cp terraform.tfvars.example terraform.tfvars > Add your Access and Secret Key
terraform plan -out terraform.tfplan
terraform apply "terraform.tfplan"
 ```
 
### 2. View More Details Through PDF Digram in this Repo.

### 3. Destroy TF Infrastrycture through this command:

```
terraform destroy
```

### 3. Create an AWS Digram by using this tool:

https://lucid.app/documents#/dashboard
