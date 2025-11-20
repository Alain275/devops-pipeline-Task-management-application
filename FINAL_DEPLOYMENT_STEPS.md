# ✅ FINAL STEPS TO DEPLOY YOUR APPLICATION

## Step 1: Run These 2 Commands (Copy & Paste into PowerShell)

```powershell
# Create ACR (wait for completion - takes 1-2 minutes)
az acr create --resource-group devopspipeline-dev-rg --name taskmanagementacr2025 --sku Basic --admin-enabled true --location southafricanorth

# Get credentials
az acr credential show --name taskmanagementacr2025
```

---

## Step 2: Copy the Output from Step 1

The second command will show you something like:
```json
{
  "passwords": [
    {
      "name": "password",
      "value": "XXXXX..."
    },
    {
      "name": "password2",
      "value": "YYYYY..."
    }
  ],
  "username": "taskmanagementacr2025"
}
```

---

## Step 3: Update GitHub Secrets

Go to: https://github.com/Pelino-Courses/devops-pipeline-Task-management-appl/settings/secrets/actions

**Update/Create these 8 secrets:**

| Secret Name | Value |
|-------------|-------|
| `ACR_NAME` | `taskmanagementacr2025` |
| `ACR_LOGIN_SERVER` | `taskmanagementacr2025.azurecr.io` |
| `ACR_USERNAME` | *(username from Step 1 output)* |
| `ACR_PASSWORD` | *(password value from Step 1 output)* |
| `AZURE_CLIENT_ID` | `696ba8e3-0be5-4fd5-ba31-11b43224366f` |
| `AZURE_CLIENT_SECRET` | `dpu8Q~qbRbk8d1h9QWSI~cjps6V~Ff3FzKPIdayg` |
| `AZURE_TENANT_ID` | `f946d46c-1763-482f-931d-f5389eb60728` |
| `AZURE_SUBSCRIPTION_ID` | `0961e932-2c86-4df1-adeb-48aa98efb487` |

---

## Step 4: Tell Me When Done!

Once you've updated all 8 secrets, paste "Done" here and I'll trigger the deployment! 🚀
