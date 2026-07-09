# Shotgun Global Installer (PowerShell)
# One line, from anywhere:
#   iwr https://raw.githubusercontent.com/Krishnatejavepa/Shotgun/main/install.ps1 -UseBasicParsing | iex
# Or run it from a cloned Shotgun repo to use that copy instead of downloading.

$ErrorActionPreference = "Stop"

$ShotgunHome = if ($env:SHOTGUN_HOME) { $env:SHOTGUN_HOME } else { Join-Path $HOME ".shotgun-os" }
$RepoUrl = "https://github.com/Krishnatejavepa/Shotgun"

# 1. Get the source: use the current directory if it's a Shotgun repo, otherwise download.
$Cwd = (Get-Location).Path
if ((Test-Path (Join-Path $Cwd "SHOTGUN.md")) -and (Test-Path (Join-Path $Cwd ".shotgun"))) {
    $SrcDir = $Cwd
    Write-Host "Using the Shotgun repo in the current directory."
} else {
    Write-Host "Downloading Shotgun to $ShotgunHome ..."
    if (Get-Command git -ErrorAction SilentlyContinue) {
        if (Test-Path (Join-Path $ShotgunHome ".git")) {
            git -C $ShotgunHome pull --quiet
        } else {
            if (Test-Path $ShotgunHome) { Remove-Item $ShotgunHome -Recurse -Force }
            git clone --depth 1 --quiet $RepoUrl $ShotgunHome
        }
    } else {
        if (Test-Path $ShotgunHome) { Remove-Item $ShotgunHome -Recurse -Force }
        New-Item -ItemType Directory -Force -Path $ShotgunHome | Out-Null
        $Zip = Join-Path $env:TEMP "shotgun-main.zip"
        Invoke-WebRequest "$RepoUrl/archive/refs/heads/main.zip" -OutFile $Zip -UseBasicParsing
        Expand-Archive -Path $Zip -DestinationPath $env:TEMP -Force
        Copy-Item -Path (Join-Path $env:TEMP "Shotgun-main\*") -Destination $ShotgunHome -Recurse -Force
        Remove-Item $Zip -Force
        Remove-Item (Join-Path $env:TEMP "Shotgun-main") -Recurse -Force
    }
    $SrcDir = $ShotgunHome
}

# 2. Install the shotgun-init function into the profile (guarded: never duplicated on re-runs).
$ProfilePath = $PROFILE
if (-not (Test-Path $ProfilePath)) {
    New-Item -Type File -Path $ProfilePath -Force | Out-Null
}

$BlockStart = "# >>> shotgun-init >>>"
$BlockEnd   = "# <<< shotgun-init <<<"

$Existing = Get-Content $ProfilePath -Raw -ErrorAction SilentlyContinue
if ($Existing -and $Existing.Contains($BlockStart)) {
    $Pattern = [regex]::Escape($BlockStart) + "[\s\S]*?" + [regex]::Escape($BlockEnd)
    $Existing = [regex]::Replace($Existing, $Pattern, "").TrimEnd()
    Set-Content -Path $ProfilePath -Value $Existing
}

$FunctionCode = @"

$BlockStart
`$env:SHOTGUN_SRC = "$SrcDir"
function shotgun-init {
    `$src = if (`$env:SHOTGUN_SRC) { `$env:SHOTGUN_SRC } else { "$SrcDir" }
    if (-not (Test-Path (Join-Path `$src "SHOTGUN.md"))) {
        Write-Host "Shotgun source not found at `$src. Re-run the installer." -ForegroundColor Red; return
    }
    # Core loop + skills
    Copy-Item -Path (Join-Path `$src "SHOTGUN.md") -Destination . -Force
    Copy-Item -Path (Join-Path `$src ".shotgun") -Destination . -Recurse -Force
    # Memory scaffold (protocol + templates + index)
    New-Item -ItemType Directory -Force -Path memory, vault\inbox, workspace | Out-Null
    foreach (`$f in @("README.md", "MEMORY.md")) {
        if (-not (Test-Path "memory\`$f")) { Copy-Item (Join-Path `$src "memory\`$f") memory\ -ErrorAction SilentlyContinue }
    }
    if (-not (Test-Path "memory\_templates")) { Copy-Item (Join-Path `$src "memory\_templates") memory\ -Recurse -ErrorAction SilentlyContinue }
    # Vault scaffold
    foreach (`$f in @("VAULT-GUIDE.md", "_index.md")) {
        if (-not (Test-Path "vault\`$f")) { Copy-Item (Join-Path `$src "vault\`$f") vault\ -ErrorAction SilentlyContinue }
    }
    # Templates, docs, workspace README
    if (-not (Test-Path "templates")) { Copy-Item (Join-Path `$src "templates") . -Recurse -ErrorAction SilentlyContinue }
    if (-not (Test-Path "docs")) { Copy-Item (Join-Path `$src "docs") . -Recurse -ErrorAction SilentlyContinue }
    if (-not (Test-Path "workspace\README.md")) { Copy-Item (Join-Path `$src "workspace\README.md") workspace\ -ErrorAction SilentlyContinue }
    # Agent entry points (AGENTS.md standard + platform-specific)
    foreach (`$f in @("AGENTS.md", "CLAUDE.md", "GEMINI.md", ".cursorrules", ".gitignore", "setup-compatibility.sh", "setup-compatibility.ps1")) {
        if (-not (Test-Path `$f)) { Copy-Item (Join-Path `$src `$f) . -ErrorAction SilentlyContinue }
    }
    New-Item -ItemType Directory -Force -Path .github | Out-Null
    if (-not (Test-Path ".github\copilot-instructions.md")) { Copy-Item (Join-Path `$src ".github\copilot-instructions.md") .github\ -ErrorAction SilentlyContinue }
    # Platform wiring (junctions for Claude Code, Cursor, Antigravity)
    try { & powershell -NoProfile -ExecutionPolicy Bypass -File .\setup-compatibility.ps1 | Out-Null } catch {}
    Write-Host "✅ Shotgun OS initialized in `$(Get-Location). Boot your agent and say hi." -ForegroundColor Green
}
$BlockEnd
"@

Add-Content -Path $ProfilePath -Value $FunctionCode
Write-Host "✅ Installed shotgun-init (source: $SrcDir)" -ForegroundColor Green
Write-Host "👉 Restart PowerShell or run '. `$PROFILE', then type 'shotgun-init' in any project folder." -ForegroundColor Cyan
