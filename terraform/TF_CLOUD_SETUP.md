# Terraform Cloud Configuration Guide

Use these specific values to configure your Terraform Cloud workspace variables.

## 1. Terraform Cloud Workspace Setup
1. Log in to [Terraform Cloud](https://app.terraform.io)
2. Create a new Organization (if you haven't already)
3. Create a new Workspace:
   - Choose **"CLI-driven workflow"**
   - Name: `devops-pipeline-infrastructure`

## 2. Configure Variables
Go to the **Variables** tab in your new workspace and add the following:

### Environment Variables
These allow Terraform to authenticate with Azure.

| Key | Value | Sensitive? |
|-----|-------|------------|
| `ARM_CLIENT_ID` | `YOUR_CLIENT_ID` | No |
| `ARM_CLIENT_SECRET` | `YOUR_CLIENT_SECRET` | **YES** |
| `ARM_TENANT_ID` | `YOUR_TENANT_ID` | No |
| `ARM_SUBSCRIPTION_ID` | `YOUR_SUBSCRIPTION_ID` | No |

### Terraform Variables
These configure your infrastructure.

| Key | Value | Sensitive? |
|-----|-------|------------|
| `ssh_public_key` | `ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEXWuyxAJYWtHql/+4Pah6UdJeexAuE612Dr5u6t1sWxU0cxyKFrOjzVHldf/oJ/ghOhcpbhW4drajtCp8TX+vfx0jV7DS3oWJafaSM72O2Zvf3zPDavWr8/z0LZIUQySyCPrwypfyROusLhF86AM3ytSnlrN+WQHNmdl1FemPHfGL9vh9xu5RIXVU22ar+X0+VLkw/opVGZ4XvabUvXoI4wHqmpS6tg489KQXAt2Z0IQdmzulm0LyUIl2jNp6HY6vnrGn4fhfsYZfz7hxaQ52ncWDmrLw9cfIDBQYaCR068c2j7GpBLxS1gojx1YDbOErDxbE7Fyd3iW16l9GLLmt45NbHXofLbFbOW6/PIwxW6ujUyAUuVqUMAV+bcL6rnde2NvyqrphBjWqvtAbPl+QAO+7y1be+lrRHDbRmXTR2aOrkiTyXyrGCjWL79AS8qpV3qKfdDh96FXyxohNwN5ktTJ9E0LBxpM3cg4fcDx9QzRYMrhH+3XERPk7QMUDjyrjbQZqHX1tWee632OaagpmDrGTu8n0apeI4wB5ZKkMt37PpEKi7AVBKK3uHcZUmtDjScgpW9r2/OEuhyOKywELO3WIwawq6ZBHLQmGLAGYc1hrauiMxxaiqyIz/D5rBKrYnHw7z3oJJIOgZCYkpHx3JOVfE0XSyG29d8/SOTr49Q== dell@DESKTOP-5K09MTL` | **YES** |

## 3. Update Local Configuration
1. Open `terraform/backend.tf`
2. Replace `your-org-name` with your actual Terraform Cloud organization name.

## 4. Initialize and Deploy
Run these commands in your terminal:

```bash
cd terraform

# Login to Terraform Cloud (opens browser)
terraform login

# Initialize
terraform init

# Deploy
terraform apply
```
