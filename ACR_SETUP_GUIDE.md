# Azure Container Registry Setup Guide

## Issue
The ACR (Azure Container Registry) `devopspipelinedevacr` doesn't exist, causing CD Pipeline to fail at Docker image push.

## Solution: Create ACR and Update GitHub Secrets

### Step 1: Create the ACR

Run this command in PowerShell:

```powershell
az acr create --resource-group devopspipeline-dev-rg --name devopspipelinedevacr --sku Basic --admin-enabled true --location southafricanorth
```

**Wait for completion** (takes about 1-2 minutes)

---

### Step 2: Get ACR Credentials

After Step 1 completes, run:

```powershell
az acr credential show --name devopspipelinedevacr --resource-group devopspipeline-dev-rg
```

**Copy the output** - you'll need these values for GitHub Secrets.

---

### Step 3: Update GitHub Secrets

Go to: https://github.com/Pelino-Courses/devops-pipeline-Task-management-appl/settings/secrets/actions

Click "New repository secret" or edit existing ones to set these **7 secrets**:

#### From Service Principal (you already have these values):
- `AZURE_CLIENT_ID` = `696ba8e3-0be5-4fd5-ba31-11b43224366f`
- `AZURE_CLIENT_SECRET` = `dpu8Q~qbRbk8d1h9QWSI~cjps6V~Ff3FzKPIdayg`
- `AZURE_TENANT_ID` = `f946d46c-1763-482f-931d-f5389eb60728`
- `AZURE_SUBSCRIPTION_ID` = `0961e932-2c86-4df1-adeb-48aa98efb487`

#### From ACR (from Step 2 output):
- `ACR_LOGIN_SERVER` = `devopspipelinedevacr.azurecr.io`
- `ACR_USERNAME` = `<username from Step 2 output>`
- `ACR_PASSWORD` = `<password or password2 from Step 2 output>`
- `ACR_NAME` = `devopspipelinedevacr`

---

### Step 4: Trigger Deployment

After updating all secrets, let me know and I'll make a commit to trigger the CD pipeline.

---

## Why This Happened

The ACR was supposed to be created during infrastructure provisioning but was skipped when we switched from Terraform to Azure CLI for the VM setup. This is the final missing piece!
