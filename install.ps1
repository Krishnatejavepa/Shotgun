# Shotgun Global Installer (PowerShell)
# Run this once from the Shotgun repository to enable the `shotgun-init` command globally.

$RepoDir = Get-Location

if (-not (Test-Path "$RepoDir\SHOTGUN.md")) {
    Write-Host "Error: You must run this script from the root of the Shotgun repository." -ForegroundColor Red
    exit
}

$ProfilePath = $PROFILE
if (-not (Test-Path $ProfilePath)) {
    New-Item -Type File -Path $ProfilePath -Force | Out-Null
}

$FunctionCode = @"

function shotgun-init {
    Copy-Item -Path `"$RepoDir\.shotgun`" -Destination . -Recurse -Force
    Copy-Item -Path `"$RepoDir\SHOTGUN.md`" -Destination . -Force
    New-Item -ItemType Directory -Force -Path memory | Out-Null
    New-Item -ItemType Directory -Force -Path vault | Out-Null
    Write-Host "✅ Shotgun OS initialized in `$(Get-Location)`. Boot your agent." -ForegroundColor Green
}
"@

Add-Content -Path $ProfilePath -Value $FunctionCode
Write-Host "✅ Added shotgun-init to your PowerShell profile." -ForegroundColor Green
Write-Host "👉 Restart PowerShell or run '. \$PROFILE', then type 'shotgun-init' in any project folder." -ForegroundColor Cyan
