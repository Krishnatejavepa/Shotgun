#!/bin/bash
# Shotgun Global Installer
# One line, from anywhere:
#   curl -sSL https://raw.githubusercontent.com/Krishnatejavepa/Shotgun/main/install.sh | bash
# Or run it from a cloned Shotgun repo to use that copy instead of downloading.

set -e

SHOTGUN_HOME="${SHOTGUN_HOME:-$HOME/.shotgun-os}"
REPO_URL="https://github.com/Krishnatejavepa/Shotgun"

# 1. Get the source: use the current directory if it's a Shotgun repo, otherwise download.
if [ -f "$(pwd)/SHOTGUN.md" ] && [ -d "$(pwd)/.shotgun" ]; then
    SRC_DIR="$(pwd)"
    echo "Using the Shotgun repo in the current directory."
else
    echo "Downloading Shotgun to $SHOTGUN_HOME ..."
    if command -v git >/dev/null 2>&1; then
        if [ -d "$SHOTGUN_HOME/.git" ]; then
            git -C "$SHOTGUN_HOME" pull --quiet || true
        else
            rm -rf "$SHOTGUN_HOME"
            git clone --depth 1 --quiet "$REPO_URL" "$SHOTGUN_HOME"
        fi
    else
        rm -rf "$SHOTGUN_HOME"
        mkdir -p "$SHOTGUN_HOME"
        curl -sSL "$REPO_URL/archive/refs/heads/main.tar.gz" | tar -xz -C "$SHOTGUN_HOME" --strip-components=1
    fi
    SRC_DIR="$SHOTGUN_HOME"
fi

# 2. Install the shotgun-init function (guarded: never duplicated on re-runs).
if [ -n "$ZSH_VERSION" ] || [[ "$SHELL" == *zsh* ]]; then
    RC_FILE="$HOME/.zshrc"
else
    RC_FILE="$HOME/.bashrc"
fi

BLOCK_START="# >>> shotgun-init >>>"
BLOCK_END="# <<< shotgun-init <<<"

# Remove any previous block, then append the fresh one.
if [ -f "$RC_FILE" ] && grep -q "$BLOCK_START" "$RC_FILE"; then
    tmpfile=$(mktemp)
    awk -v s="$BLOCK_START" -v e="$BLOCK_END" '$0==s{skip=1} !skip; $0==e{skip=0}' "$RC_FILE" > "$tmpfile"
    mv "$tmpfile" "$RC_FILE"
fi

cat >> "$RC_FILE" <<EOF
$BLOCK_START
export SHOTGUN_SRC="$SRC_DIR"
shotgun-init() {
    local src="\${SHOTGUN_SRC:-$SRC_DIR}"
    if [ ! -f "\$src/SHOTGUN.md" ]; then
        echo "Shotgun source not found at \$src. Re-run the installer."; return 1
    fi
    # Core loop + skills
    cp "\$src/SHOTGUN.md" .
    cp -R "\$src/.shotgun" .
    # Memory scaffold (protocol + templates + index)
    mkdir -p memory vault/inbox workspace
    cp -n "\$src/memory/README.md" memory/ 2>/dev/null || true
    cp -n "\$src/memory/MEMORY.md" memory/ 2>/dev/null || true
    [ -d "\$src/memory/_templates" ] && cp -Rn "\$src/memory/_templates" memory/ 2>/dev/null || true
    # Vault scaffold
    cp -n "\$src/vault/VAULT-GUIDE.md" vault/ 2>/dev/null || true
    cp -n "\$src/vault/_index.md" vault/ 2>/dev/null || true
    # Templates, docs, workspace README
    [ -d "\$src/templates" ] && cp -Rn "\$src/templates" . 2>/dev/null || true
    [ -d "\$src/docs" ] && cp -Rn "\$src/docs" . 2>/dev/null || true
    cp -n "\$src/workspace/README.md" workspace/ 2>/dev/null || true
    # Agent entry points (AGENTS.md standard + platform-specific)
    cp -n "\$src/AGENTS.md" . 2>/dev/null || true
    cp -n "\$src/CLAUDE.md" . 2>/dev/null || true
    cp -n "\$src/GEMINI.md" . 2>/dev/null || true
    cp -n "\$src/.cursorrules" . 2>/dev/null || true
    mkdir -p .github && cp -n "\$src/.github/copilot-instructions.md" .github/ 2>/dev/null || true
    # Safety net + platform wiring
    [ -f .gitignore ] || cp "\$src/.gitignore" . 2>/dev/null || true
    cp -n "\$src/setup-compatibility.sh" . 2>/dev/null || true
    cp -n "\$src/setup-compatibility.ps1" . 2>/dev/null || true
    bash ./setup-compatibility.sh >/dev/null 2>&1 || true
    echo "✅ Shotgun OS initialized in \$(pwd). Boot your agent and say hi."
}
shotgun-upgrade() {
    local src="\${SHOTGUN_SRC:-$SRC_DIR}"
    # 0. Refresh the source to the latest release.
    if [ -d "\$src/.git" ]; then
        git -C "\$src" pull --quiet 2>/dev/null || echo "⚠️  Could not pull latest source; upgrading with the local copy."
    fi
    if [ ! -f "\$src/SHOTGUN.md" ]; then
        echo "Shotgun source not found at \$src. Re-run the installer."; return 1
    fi
    # 1. Sanity: this must be a Shotgun project, and not the source itself.
    if [ "\$(pwd)" = "\$src" ]; then
        echo "This IS the Shotgun source. Run shotgun-upgrade inside your project folder."; return 1
    fi
    if [ ! -f SHOTGUN.md ] && [ ! -d .shotgun ] && [ ! -d skills ]; then
        echo "This doesn't look like a Shotgun folder (no SHOTGUN.md, .shotgun/, or skills/)."; return 1
    fi
    local old_ver="unknown"
    [ -f SHOTGUN.md ] && old_ver=\$(grep -oE 'Shotgun v[0-9.]+' SHOTGUN.md | head -1)
    # 2. Warn on uncommitted work (we still back up ourselves).
    if [ -d .git ] && [ -n "\$(git status --porcelain 2>/dev/null)" ]; then
        echo "⚠️  Uncommitted changes detected. Consider committing first; proceeding with a backup either way."
    fi
    # 3. Back up everything the upgrade may overwrite.
    local stamp=\$(date +%Y-%m-%d-%H%M%S)
    local bak=".shotgun-upgrade-backup-\$stamp"
    mkdir -p "\$bak"
    [ -f SHOTGUN.md ] && cp SHOTGUN.md "\$bak/"
    [ -d .shotgun ] && cp -R .shotgun "\$bak/"
    # 4. Migrate the pre-v1.2 layout: learned skills lived in skills/.
    if [ -d skills ]; then
        mkdir -p .shotgun/skills
        for d in skills/learned-*; do
            [ -d "\$d" ] && cp -Rn "\$d" .shotgun/skills/ 2>/dev/null || true
        done
    fi
    # 5. Overwrite framework files with the new release. Deletes nothing,
    #    so learned-* skills and any user-added files survive untouched.
    cp -f "\$src/SHOTGUN.md" .
    (cd "\$src" && find .shotgun -type f) | while IFS= read -r f; do
        mkdir -p "\$(dirname "\$f")"
        cp -f "\$src/\$f" "\$f"
    done
    # Framework-owned docs and scaffolding (never founder data).
    [ -d "\$src/docs" ] && mkdir -p docs && cp -f "\$src"/docs/*.md docs/ 2>/dev/null || true
    [ -d "\$src/templates" ] && mkdir -p templates && cp -f "\$src"/templates/*.md templates/ 2>/dev/null || true
    mkdir -p memory vault/inbox workspace
    cp -f "\$src/memory/README.md" memory/ 2>/dev/null || true
    [ -d "\$src/memory/_templates" ] && mkdir -p memory/_templates && cp -f "\$src"/memory/_templates/*.md memory/_templates/ 2>/dev/null || true
    cp -f "\$src/vault/VAULT-GUIDE.md" vault/ 2>/dev/null || true
    cp -f "\$src/AGENTS.md" "\$src/CLAUDE.md" "\$src/GEMINI.md" "\$src/.cursorrules" . 2>/dev/null || true
    mkdir -p .github && cp -f "\$src/.github/copilot-instructions.md" .github/ 2>/dev/null || true
    cp -f "\$src/setup-compatibility.sh" "\$src/setup-compatibility.ps1" . 2>/dev/null || true
    # New-in-this-release files that shouldn't overwrite founder data.
    cp -n "\$src/memory/MEMORY.md" memory/ 2>/dev/null || true
    cp -n "\$src/vault/_index.md" vault/ 2>/dev/null || true
    cp -n "\$src/workspace/README.md" workspace/ 2>/dev/null || true
    [ -f .gitignore ] || cp "\$src/.gitignore" . 2>/dev/null || true
    bash ./setup-compatibility.sh >/dev/null 2>&1 || true
    local new_ver=\$(grep -oE 'Shotgun v[0-9.]+' SHOTGUN.md | head -1)
    echo "✅ Upgraded: \$old_ver → \$new_ver"
    echo "🧠 Untouched by contract: memory/, vault/, workspace/, learned-* skills, .env"
    echo "🗂  Backup of the old framework: \$bak/"
    echo "👉 If you had customized SHOTGUN.md, diff it: diff \$bak/SHOTGUN.md SHOTGUN.md"
}
$BLOCK_END
EOF

echo "✅ Installed shotgun-init (source: $SRC_DIR)"
echo "👉 Run 'source $RC_FILE' or open a new terminal, then type 'shotgun-init' in any project folder."
