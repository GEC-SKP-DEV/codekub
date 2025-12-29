#!/bin/bash
set -e

# If Chrome is already installed, skip
if command -v google-chrome >/dev/null 2>&1; then
  echo "✅ Google Chrome already installed. Skipping."
  xdg-settings set default-web-browser google-chrome.desktop || true
  return 0 2>/dev/null || true
fi

echo "⬇️ Installing Google Chrome..."

TMP_DEB="/tmp/google-chrome-stable_current_amd64.deb"

# Clean old or corrupted file
rm -f "$TMP_DEB"

# Download with fixed filename
wget -O "$TMP_DEB" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install
sudo apt install -y "$TMP_DEB"

# Cleanup
rm -f "$TMP_DEB"

# Set default browser
xdg-settings set default-web-browser google-chrome.desktop || true

echo "🎉 Google Chrome installed
