# Installs `oc` globally (Windows). Run: ./bin/install.ps1
$npmDir = "$env:APPDATA\npm"
if (-not (Test-Path $npmDir)) { New-Item -ItemType Directory -Path $npmDir -Force | Out-Null }
Copy-Item -Force "$PSScriptRoot\oc.ps1" "$npmDir\oc.ps1"
Copy-Item -Force "$PSScriptRoot\oc.cmd" "$npmDir\oc.cmd"
Write-Output "Installed oc -> $npmDir\oc.cmd"
& "$npmDir\oc.cmd" --version
