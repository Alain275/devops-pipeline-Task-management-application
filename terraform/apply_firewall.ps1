# Script to apply Terraform changes for Firewall
# Refresh Path to ensure Terraform is found
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + [System.Environment]::GetEnvironmentVariable("Path","Machine")

Write-Host "Applying Firewall Rules..." -ForegroundColor Cyan
terraform apply -auto-approve
Write-Host "Firewall Rules Updated!" -ForegroundColor Green
Write-Host "You should now be able to access:"
Write-Host "Frontend: http://4.221.172.88:5173"
Write-Host "Backend: http://4.221.172.88:7000"
