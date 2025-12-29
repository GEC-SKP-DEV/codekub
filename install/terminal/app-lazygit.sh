#!/bin/bash
set -e

# ---------- Install lazygit binary ----------
if command -v lazygit >/dev/null 2>&1; then
  echo "✅ LazyGit already installed. Skipping binary install."
else
  echo "⬇️ Installing LazyGit..."

  TMP_TAR="/tmp/lazygit.tar.gz"
  TMP_DIR="/tmp/lazygit-extract"

  rm -f "$TMP_TAR"
  rm -rf "$TMP_DIR"
  mkdir -p "$TMP_DIR"

  LAZYGIT_VERSION=$(curl -fsSL \
    https://api.github.com/repos/jesseduffield/lazygit/releases/latest \
    | grep -Po '"tag_name": "v\K[^"]*')

  curl -fsSL -o "$TMP_TAR" \
    "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

  tar -xzf "$TMP_TAR" -C "$TMP_DIR"

  sudo install -m 0755 "$TMP_DIR/lazygit" /usr/local/bin/lazygit

  rm -rf "$TMP_TAR" "$TMP_DIR"
fi

# ---------- User config ----------
LAZYGIT_CONFIG="$HOME/.config/lazygit"

mkdir -p "$LAZYGIT_CONFIG"

# Create config only if missing
if [ ! -f "$LAZYGIT_CONFIG/config.yml" ]; then
  touch "$LAZYGIT_CONFIG/config.yml"
fi

echo "🎉 LazyGit setup complete"
