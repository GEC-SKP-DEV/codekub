#!/bin/bash
set -e

# ---------- Install Neovim binary ----------
if command -v nvim >/dev/null 2>&1; then
  echo "✅ Neovim already installed. Skipping binary install."
else
  echo "⬇️ Installing Neovim..."

  TMP_TAR="/tmp/nvim.tar.gz"
  TMP_DIR="/tmp/nvim-extract"

  rm -f "$TMP_TAR"
  rm -rf "$TMP_DIR"
  mkdir -p "$TMP_DIR"

  wget -O "$TMP_TAR" \
    https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz

  tar -xzf "$TMP_TAR" -C "$TMP_DIR"

  sudo install -m 0755 "$TMP_DIR"/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  sudo cp -R "$TMP_DIR"/nvim-linux-x86_64/lib /usr/local/
  sudo cp -R "$TMP_DIR"/nvim-linux-x86_64/share /usr/local/

  rm -rf "$TMP_TAR" "$TMP_DIR"
fi

# ---------- Dependencies for LazyVim ----------
echo "📦 Installing Neovim dependencies..."
sudo apt install -y luarocks tree-sitter-cli

# ---------- User configuration (only first run) ----------
NVIM_CONFIG="$HOME/.config/nvim"

if [ ! -d "$NVIM_CONFIG" ]; then
  echo "⚙️ Setting up LazyVim..."

  git clone https://github.com/LazyVim/starter "$NVIM_CONFIG"
  rm -rf "$NVIM_CONFIG/.git"

  # Transparency
  mkdir -p "$NVIM_CONFIG/plugin/after"
  cp "$HOME/.local/share/omakub/configs/neovim/transparency.lua" \
     "$NVIM_CONFIG/plugin/after/"

  # Theme (Tokyo Night)
  mkdir -p "$NVIM_CONFIG/lua/plugins"
  cp "$HOME/.local/share/omakub/themes/tokyo-night/neovim.lua" \
     "$NVIM_CONFIG/lua/plugins/theme.lua"

  # Disable animated scrolling
  cp "$HOME/.local/share/omakub/configs/neovim/snacks-animated-scrolling-off.lua" \
     "$NVIM_CONFIG/lua/plugins/"

  # Turn off relative line numbers (append safely)
  OPTIONS_FILE="$NVIM_CONFIG/lua/config/options.lua"
  mkdir -p "$(dirname "$OPTIONS_FILE")"
  grep -q "relativenumber" "$OPTIONS_FILE" 2>/dev/null || \
    echo "vim.opt.relativenumber = false" >> "$OPTIONS_FILE"

  # Neo-tree default
  cp "$HOME/.local/share/omakub/configs/neovim/lazyvim.json" \
     "$NVIM_CONFIG/"

  echo "🎉 LazyVim configured"
else
  echo "✅ Neovim config already exists. Skipping setup."
fi

# ---------- Desktop launcher ----------
if [ -d "$HOME/.local/share/applications" ]; then
  echo "🖥️ Installing Neovim desktop launcher..."

  sudo rm -f /usr/share/applications/nvim.desktop
  sudo rm -f /usr/local/share/applications/nvim.desktop

  source "$HOME/.local/share/omakub/applications/Neovim.sh"
fi

echo "✅ Neovim setup complete"
