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
function shotgun-upgrade {
    `$src = if (`$env:SHOTGUN_SRC) { `$env:SHOTGUN_SRC } else { "$SrcDir" }
    # 0. Refresh the source to the latest release.
    if (Test-Path (Join-Path `$src ".git")) {
        try { git -C `$src pull --quiet } catch { Write-Host "⚠️  Could not pull latest source; upgrading with the local copy." }
    }
    if (-not (Test-Path (Join-Path `$src "SHOTGUN.md"))) {
        Write-Host "Shotgun source not found at `$src. Re-run the installer." -ForegroundColor Red; return
    }
    # 1. Sanity: must be a Shotgun project, and not the source itself.
    if ((Get-Location).Path -eq `$src) {
        Write-Host "This IS the Shotgun source. Run shotgun-upgrade inside your project folder." -ForegroundColor Red; return
    }
    if (-not (Test-Path "SHOTGUN.md") -and -not (Test-Path ".shotgun") -and -not (Test-Path "skills")) {
        Write-Host "This doesn't look like a Shotgun folder (no SHOTGUN.md, .shotgun, or skills)." -ForegroundColor Red; return
    }
    `$oldVer = "unknown"
    if (Test-Path "SHOTGUN.md") {
        `$m = Select-String -Path "SHOTGUN.md" -Pattern "Shotgun v[0-9.]+" | Select-Object -First 1
        if (`$m) { `$oldVer = `$m.Matches[0].Value }
    }
    # 2. Back up everything the upgrade may overwrite.
    `$stamp = Get-Date -Format "yyyy-MM-dd-HHmmss"
    `$bak = ".shotgun-upgrade-backup-`$stamp"
    New-Item -ItemType Directory -Force -Path `$bak | Out-Null
    if (Test-Path "SHOTGUN.md") { Copy-Item "SHOTGUN.md" `$bak }
    if (Test-Path ".shotgun") { Copy-Item ".shotgun" `$bak -Recurse }
    # 3. Migrate the pre-v1.2 layout: learned skills lived in skills\.
    if (Test-Path "skills") {
        New-Item -ItemType Directory -Force -Path ".shotgun\skills" | Out-Null
        Get-ChildItem "skills" -Directory -Filter "learned-*" -ErrorAction SilentlyContinue | ForEach-Object {
            if (-not (Test-Path ".shotgun\skills\`$(`$_.Name)")) { Copy-Item `$_.FullName ".shotgun\skills\" -Recurse }
        }
    }
    # 4. Overwrite framework files. Deletes nothing: learned-* skills and user files survive.
    Copy-Item (Join-Path `$src "SHOTGUN.md") . -Force
    Push-Location `$src
    `$fwFiles = Get-ChildItem ".shotgun" -Recurse -File | ForEach-Object { `$_.FullName.Substring(`$src.Length + 1) }
    Pop-Location
    foreach (`$f in `$fwFiles) {
        `$destDir = Split-Path `$f -Parent
        if (`$destDir) { New-Item -ItemType Directory -Force -Path `$destDir | Out-Null }
        Copy-Item (Join-Path `$src `$f) `$f -Force
    }
    foreach (`$dir in @("docs", "templates")) {
        if (Test-Path (Join-Path `$src `$dir)) {
            New-Item -ItemType Directory -Force -Path `$dir | Out-Null
            Copy-Item (Join-Path `$src "`$dir\*.md") `$dir -Force -ErrorAction SilentlyContinue
        }
    }
    New-Item -ItemType Directory -Force -Path memory, memory\_templates, vault\inbox, workspace | Out-Null
    Copy-Item (Join-Path `$src "memory\README.md") memory\ -Force -ErrorAction SilentlyContinue
    Copy-Item (Join-Path `$src "memory\_templates\*.md") memory\_templates\ -Force -ErrorAction SilentlyContinue
    Copy-Item (Join-Path `$src "vault\VAULT-GUIDE.md") vault\ -Force -ErrorAction SilentlyContinue
    foreach (`$f in @("AGENTS.md", "CLAUDE.md", "GEMINI.md", ".cursorrules", "setup-compatibility.sh", "setup-compatibility.ps1")) {
        Copy-Item (Join-Path `$src `$f) . -Force -ErrorAction SilentlyContinue
    }
    New-Item -ItemType Directory -Force -Path .github | Out-Null
    Copy-Item (Join-Path `$src ".github\copilot-instructions.md") .github\ -Force -ErrorAction SilentlyContinue
    # New-in-this-release files that must not overwrite founder data.
    foreach (`$pair in @(@("memory\MEMORY.md", "memory\"), @("vault\_index.md", "vault\"), @("workspace\README.md", "workspace\"))) {
        if (-not (Test-Path `$pair[0])) { Copy-Item (Join-Path `$src `$pair[0]) `$pair[1] -ErrorAction SilentlyContinue }
    }
    if (-not (Test-Path ".gitignore")) { Copy-Item (Join-Path `$src ".gitignore") . -ErrorAction SilentlyContinue }
    try { & powershell -NoProfile -ExecutionPolicy Bypass -File .\setup-compatibility.ps1 | Out-Null } catch {}
    `$newVer = (Select-String -Path "SHOTGUN.md" -Pattern "Shotgun v[0-9.]+" | Select-Object -First 1).Matches[0].Value
    Write-Host "✅ Upgraded: `$oldVer → `$newVer" -ForegroundColor Green
    Write-Host "🧠 Untouched by contract: memory\, vault\, workspace\, learned-* skills, .env"
    Write-Host "🗂  Backup of the old framework: `$bak\"
    Write-Host "👉 If you had customized SHOTGUN.md, diff it against the backup copy."
}
$BlockEnd
"@

Add-Content -Path $ProfilePath -Value $FunctionCode
Write-Host "✅ Installed shotgun-init (source: $SrcDir)" -ForegroundColor Green
Write-Host "👉 Restart PowerShell or run '. `$PROFILE', then type 'shotgun-init' in any project folder." -ForegroundColor Cyan
