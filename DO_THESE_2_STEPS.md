# 🚀 SIMPLE 2-STEP GUIDE

## YOU NEED TO DO THESE 2 THINGS (I Cannot Do Them For You)

### STEP 1: Run in YOUR PowerShell (Where `az` works)

```powershell
az acr create --resource-group devopspipeline-dev-rg --name taskmanagementacr2025 --sku Basic --admin-enabled true --location southafricanorth

az acr credential show --name taskmanagementacr2025
```

**Copy the username and password from the output!**

---

### STEP 2: Update GitHub Secrets

1. Go to: https://github.com/Pelino-Courses/devops-pipeline-Task-management-appl/settings/secrets/actions

2. Click "New repository secret" or edit existing ones

3. Add/Update these **8 secrets**:

```
ACR_NAME = taskmanagementacr2025
ACR_LOGIN_SERVER = taskmanagementacr2025.azurecr.io  
ACR_USERNAME = (from Step 1)
ACR_PASSWORD = (from Step 1)
AZURE_CLIENT_ID = 696ba8e3-0be5-4fd5-ba31-11b43224366f
AZURE_CLIENT_SECRET = dpu8Q~qbRbk8d1h9QWSI~cjps6V~Ff3FzKPIdayg
AZURE_TENANT_ID = f946d46c-1763-482f-931d-f5389eb60728
AZURE_SUBSCRIPTION_ID = 0961e932-2c86-4df1-adeb-48aa98efb487
```

---

## ✅ What I've Already Done:

- Updated all code to use new ACR name
- Committed and pushed changes
- Set up deployment configuration

## 🎯 After You Complete Steps 1 & 2:

The deployment will trigger automatically and your app will be live!

**Type "DONE" when you've completed both steps!** 🚀
