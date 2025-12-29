#!/bin/bash
set -e

# ---------- Install zellij binary ----------
if command -v zellij >/dev/null 2>&1; then
  echo "✅ Zellij already installed. Skipping binary install."
else
  echo "⬇️ Installing Zellij..."

  TMP_TAR="/tmp/zellij.tar.gz"
  TMP_DIR="/tmp/zellij-extract"

  rm -f "$TMP_TAR"
  rm -rf "$TMP_DIR"
  mkdir -p "$TMP_DIR"

  wget -O "$TMP_TAR" \
    https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz

  tar -xzf "$TMP_TAR" -C "$TMP_DIR"

  sudo install -m 0755 "$TMP_DIR/zellij" /usr/local/bin/zellij

  rm -rf "$TMP_TAR" "$TMP_DIR"
fi

# ---------- User config ----------
ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"
ZELLIJ_THEME_DIR="$ZELLIJ_CONFIG_DIR/themes"

mkdir -p "$ZELLIJ_THEME_DIR"

# Copy default config only if missing
if [ ! -f "$ZELLIJ_CONFIG_DIR/config.kdl" ]; then
  echo "📄 Installing default Zellij config..."
  cp "$HOME/.local/share/omakub/configs/zellij.kdl" \
     "$ZELLIJ_CONFIG_DIR/config.kdl"
fi

# Ensure Tokyo Night theme exists
if [ ! -f "$ZELLIJ_THEME_DIR/tokyo-night.kdl" ]; then
  echo "🎨 Installing Tokyo Night theme..."
  cp "$HOME/.local/share/omakub/themes/tokyo-night/zellij.kdl" \
     "$ZELLIJ_THEME_DIR/tokyo-night.kdl"
fi

echo "🎉 Zellij setup complete"
