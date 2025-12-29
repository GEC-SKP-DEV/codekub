#!/bin/bash
set -e

# Skip if already installed
if command -v obsidian >/dev/null 2>&1; then
  echo "✅ Obsidian already installed. Skipping."
  return 0 2>/dev/null || true

fi

echo "⬇️ Installing Obsidian..."

TMP_DEB="/tmp/obsidian.deb"

# Get latest version
OBSIDIAN_VERSION=$(curl -fsSL https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest \
  | grep -Po '"tag_name": "v\K[^"]*')

# Cleanup old file
rm -f "$TMP_DEB"

# Download
wget -O "$TMP_DEB" \
  "https://github.com/obsidianmd/obsidian-releases/releases/latest/download/obsidian_${OBSIDIAN_VERSION}_amd64.deb"

# Validate package
dpkg-deb --info "$TMP_DEB" >/dev/null

# Install
sudo apt install -y "$TMP_DEB"

# Cleanup
rm -f "$TMP_DEB"

echo "🎉 Obsidian installed successfully"
