#!/bin/bash
set -e

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

echo "🔤 Installing fonts..."

# ---------- Cascadia Mono Nerd Font ----------
if ls "$FONT_DIR"/CascadiaMono*.ttf >/dev/null 2>&1; then
  echo "✅ Cascadia Mono already installed. Skipping."
else
  echo "⬇️ Installing Cascadia Mono Nerd Font..."
  TMP_ZIP="/tmp/CascadiaMono.zip"
  TMP_DIR="/tmp/CascadiaFont"

  rm -f "$TMP_ZIP"
  rm -rf "$TMP_DIR"

  wget -O "$TMP_ZIP" \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip

  unzip -q "$TMP_ZIP" -d "$TMP_DIR"
  cp "$TMP_DIR"/*.ttf "$FONT_DIR"

  rm -rf "$TMP_ZIP" "$TMP_DIR"
fi

# ---------- iA Writer Mono ----------
if ls "$FONT_DIR"/iAWriterMono*.ttf >/dev/null 2>&1; then
  echo "✅ iA Writer Mono already installed. Skipping."
else
  echo "⬇️ Installing iA Writer Mono..."
  TMP_ZIP="/tmp/iafonts.zip"
  TMP_DIR="/tmp/iaFonts"

  rm -f "$TMP_ZIP"
  rm -rf "$TMP_DIR"

  wget -O "$TMP_ZIP" \
    https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip

  unzip -q "$TMP_ZIP" -d "$TMP_DIR"
  cp "$TMP_DIR"/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf \
     "$FONT_DIR"

  rm -rf "$TMP_ZIP" "$TMP_DIR"
fi

# ---------- Refresh font cache ----------
echo "🔄 Refreshing font cache..."
fc-cache -f

echo "🎉 Fonts installed successfully"
