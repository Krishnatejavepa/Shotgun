Write-Host "Setting up Shotgun platform compatibility (Windows)..."

if (-Not (Test-Path ".shotgun")) {
    Write-Host "Error: .shotgun directory not found. Are you in the Shotgun root?" -ForegroundColor Red
    exit 1
}

# Claude Code
if (Test-Path ".claude") { Remove-Item ".claude" -Force -Recurse -ErrorAction SilentlyContinue }
cmd /c mklink /J .claude .shotgun | Out-Null
Write-Host "✅ Claude Code compatibility enabled (.claude -> .shotgun)"

# Antigravity
if (-Not (Test-Path ".agents")) { New-Item -ItemType Directory -Force -Path ".agents" | Out-Null }
if (Test-Path ".agents\skills") { Remove-Item ".agents\skills" -Force -Recurse -ErrorAction SilentlyContinue }
cmd /c mklink /J .agents\skills .shotgun\skills | Out-Null
Write-Host "✅ Antigravity compatibility enabled (.agents\skills -> .shotgun\skills)"

# Cursor
if (-Not (Test-Path ".cursor")) { New-Item -ItemType Directory -Force -Path ".cursor" | Out-Null }
if (Test-Path ".cursor\rules") { Remove-Item ".cursor\rules" -Force -Recurse -ErrorAction SilentlyContinue }
cmd /c mklink /J .cursor\rules .shotgun\skills | Out-Null
Write-Host "✅ Cursor compatibility enabled (.cursor\rules -> .shotgun\skills)"

Write-Host "Done!"
