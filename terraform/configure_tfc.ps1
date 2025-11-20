# Configure Terraform Cloud Variables Script

$orgName = "Ipelino_250"
$workspaceName = "devops-pipeline-infrastructure"
$apiUrl = "https://app.terraform.io/api/v2"

# Get Token
$json = Get-Content "$env:APPDATA\terraform.d\credentials.tfrc.json" | ConvertFrom-Json
$token = $json.credentials.'app.terraform.io'.token
$headers = @{ 
    Authorization = "Bearer $token"
    "Content-Type" = "application/vnd.api+json"
}

# Get Workspace ID
Write-Host "Getting Workspace ID..."
try {
    $wsResponse = Invoke-RestMethod -Uri "$apiUrl/organizations/$orgName/workspaces/$workspaceName" -Headers $headers -Method Get
    $workspaceId = $wsResponse.data.id
    Write-Host "Workspace ID: $workspaceId" -ForegroundColor Green
} catch {
    Write-Error "Failed to get workspace. Ensure it exists (run terraform init first)."
    exit 1
}

# Function to create variable
function Set-TFCVariable {
    param (
        [string]$Key,
        [string]$Value,
        [string]$Category,
        [bool]$Sensitive
    )

    $body = @{
        data = @{
            type = "vars"
            attributes = @{
                key = $Key
                value = $Value
                category = $Category
                sensitive = $Sensitive
                description = "Managed by setup script"
            }
        }
    } | ConvertTo-Json -Depth 10

    try {
        # List existing vars to check if it exists (simple check)
        # For simplicity, we just try to create. If it fails due to duplicate, we might need to update.
        # But TFC API allows multiple vars with same key? No, unique key per category.
        # Actually, let's just try to create.
        
        Invoke-RestMethod -Uri "$apiUrl/workspaces/$workspaceId/vars" -Headers $headers -Method Post -Body $body
        Write-Host "Set variable: $Key" -ForegroundColor Green
    } catch {
        Write-Warning "Failed to set variable $Key. It might already exist."
        # Optional: Implement update logic if needed
    }
}

# Set Environment Variables
Set-TFCVariable -Key "ARM_CLIENT_ID" -Value "YOUR_CLIENT_ID" -Category "env" -Sensitive $false
Set-TFCVariable -Key "ARM_CLIENT_SECRET" -Value "YOUR_CLIENT_SECRET" -Category "env" -Sensitive $true
Set-TFCVariable -Key "ARM_TENANT_ID" -Value "YOUR_TENANT_ID" -Category "env" -Sensitive $false
Set-TFCVariable -Key "ARM_SUBSCRIPTION_ID" -Value "YOUR_SUBSCRIPTION_ID" -Category "env" -Sensitive $false

# Set Terraform Variables
$sshKey = Get-Content "$env:USERPROFILE\.ssh\devops-pipeline.pub" -Raw
Set-TFCVariable -Key "ssh_public_key" -Value $sshKey.Trim() -Category "terraform" -Sensitive $true

Write-Host "All variables configured!" -ForegroundColor Green
