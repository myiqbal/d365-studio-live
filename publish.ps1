# Publishes the newest Studio file to the live link.
# Usage (PowerShell):  .\publish.ps1
# Optional: .\publish.ps1 -Html "C:\path\to\D365-Design-Studio.html"
param(
  [string]$Html = "C:\Users\muham\Business Analyst Software\d365-design-studio\release\D365-Design-Studio.html",
  [string]$Repo = "C:\Users\muham\Business Analyst Software\d365-studio-live"
)
if (-not (Test-Path $Html)) { Write-Host "Cannot find $Html"; exit 1 }
if (-not (Test-Path "$Repo\.git")) { Write-Host "Cannot find the live repository at $Repo"; exit 1 }
Copy-Item $Html "$Repo\index.html" -Force
Set-Location $Repo
git add index.html
git commit -m ("Update Studio " + (Get-Date -Format "yyyy-MM-dd HH:mm"))
git push
Write-Host "Done. The link updates in about a minute."
