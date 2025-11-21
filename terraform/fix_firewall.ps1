# Script to fix firewall by importing existing resources
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + [System.Environment]::GetEnvironmentVariable("Path","Machine")

Write-Host "Importing Resource Group..." -ForegroundColor Cyan
terraform import azurerm_resource_group.main /subscriptions/0961e932-2c86-4df1-adeb-48aa98efb487/resourceGroups/devopspipeline-dev-rg

Write-Host "Importing Network Security Group..." -ForegroundColor Cyan
terraform import azurerm_network_security_group.main /subscriptions/0961e932-2c86-4df1-adeb-48aa98efb487/resourceGroups/devopspipeline-dev-rg/providers/Microsoft.Network/networkSecurityGroups/devopspipeline-dev-nsg

Write-Host "Applying Firewall Rules (Targeting NSG)..." -ForegroundColor Cyan
terraform apply -target=azurerm_network_security_group.main -auto-approve

Write-Host "Firewall Fixed! Try accessing the app now." -ForegroundColor Green
