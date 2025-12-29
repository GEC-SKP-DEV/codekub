#!/bin/bash
set -e

# Skip if already installed
if command -v localsend >/dev/null 2>&1; then
  echo "✅ LocalSend already installed. Skipping."
  return 0 2>/dev/null || true

fi

echo "⬇️ Installing LocalSend..."

TMP_DEB="/tmp/localsend.deb"

# Get latest version
LOCALSEND_VERSION=$(curl -fsSL https://api.github.com/repos/localsend/localsend/releases/latest \
  | grep -Po '"tag_name": "v\K[^"]*')

# Cleanup old file
rm -f "$TMP_DEB"

# Download
wget -O "$TMP_DEB" \
  "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"

# Validate package
dpkg-deb --info "$TMP_DEB" >/dev/null

# Install
sudo apt install -y "$TMP_DEB"

# Cleanup
rm -f "$TMP_DEB"

echo "🎉 LocalSend installed successfully"
