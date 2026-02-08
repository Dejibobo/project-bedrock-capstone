# Project Bedrock Capstone

AWS EKS + Terraform capstone deployment (Retail Store Sample App).

## Repo layout
- `terraform/` Terraform infrastructure (EKS cluster + supporting resources)
- `k8s/` Kubernetes manifests / Helm values used for deployment
- `lambda/` Lambda function source used for S3 event processing (if required)

## Quick start
```bash
cd terraform
terraform init
terraform plan
terraform apply
