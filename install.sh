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
$BLOCK_END
EOF

echo "✅ Installed shotgun-init (source: $SRC_DIR)"
echo "👉 Run 'source $RC_FILE' or open a new terminal, then type 'shotgun-init' in any project folder."
