# Terraform Setup Script

# Refresh Path to ensure Terraform is found
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + [System.Environment]::GetEnvironmentVariable("Path","Machine")

# Check if logged in
$credPath = "$env:APPDATA\terraform.d\credentials.tfrc.json"
if (Test-Path $credPath) {
    Write-Host "Step 1: Already logged into Terraform Cloud. Skipping login." -ForegroundColor Green
} else {
    Write-Host "Step 1: Logging into Terraform Cloud..." -ForegroundColor Cyan
    terraform login
}

Write-Host "`nStep 2: Configuring Organization..." -ForegroundColor Cyan
$orgName = "Ipelino_250"
Write-Host "Using Organization: $orgName" -ForegroundColor Green

Write-Host "`nStep 3: Initializing Terraform..." -ForegroundColor Cyan
terraform init

Write-Host "`nStep 4: Applying Infrastructure..." -ForegroundColor Cyan
# Use -auto-approve to avoid interactive prompt
terraform apply -auto-approve

Write-Host "`nDone! Infrastructure deployed successfully." -ForegroundColor Green
Write-Host "To destroy resources later, run: terraform destroy -auto-approve" -ForegroundColor Yellow
