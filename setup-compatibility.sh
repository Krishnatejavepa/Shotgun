#!/bin/bash
echo "Setting up Shotgun platform compatibility (macOS/Linux)..."

# Ensure .shotgun exists
if [ ! -d ".shotgun" ]; then
  echo "Error: .shotgun directory not found. Are you in the Shotgun root?"
  exit 1
fi

# Claude Code
rm -f .claude
ln -sfn .shotgun .claude
echo "✅ Claude Code compatibility enabled (.claude -> .shotgun)"

# Antigravity
mkdir -p .agents
rm -f .agents/skills
ln -sfn ../.shotgun/skills .agents/skills
echo "✅ Antigravity compatibility enabled (.agents/skills -> .shotgun/skills)"

# Cursor
mkdir -p .cursor
rm -f .cursor/rules
ln -sfn ../.shotgun/skills .cursor/rules
echo "✅ Cursor compatibility enabled (.cursor/rules -> .shotgun/skills)"

echo "Done!"
