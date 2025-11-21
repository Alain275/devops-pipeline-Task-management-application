# Script to fix firewall (Targeting NSG only)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + [System.Environment]::GetEnvironmentVariable("Path","Machine")

Write-Host "Applying Firewall Rules (Targeting NSG)..." -ForegroundColor Cyan
# Use quotes for the target to avoid PowerShell parsing issues
terraform apply -target="azurerm_network_security_group.main" -auto-approve

Write-Host "Firewall Fixed! Try accessing the app now." -ForegroundColor Green
