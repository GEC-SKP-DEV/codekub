#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# ROOT_DIR = repo root (one level above zgec)
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

DESKTOP_DIR="$ROOT_DIR/install/desktop"
TERMINAL_DIR="$ROOT_DIR/install/terminal"
APPLICATIONS_DIR="$ROOT_DIR/applications"

DESKTOP_FILES=(
  "app-flameshot.sh"
  "app-pinta.sh"
  "app-postman.sh"
  "app-typora.sh"
  "app-xournalpp.sh"
)

TERMINAL_FILES=(
  "app-zellij.sh"
  "app-btop.sh"
  "app-lazygit.sh"
  "docker.sh"
)

APPLICATIONS_FILES=(
  "About.sh"
  "Activity.sh"
 
  "Docker.sh"

  "Neovim.sh"
  "Omakub.sh"

)

echo "🧹 Cleaning desktop apps..."
for file in "${DESKTOP_FILES[@]}"; do
  if [ -e "$DESKTOP_DIR/$file" ]; then
    rm -rf "$DESKTOP_DIR/$file"
    echo "  ✔ removed $file"
  else
    echo "  ⚠ $file not found"
  fi
done

echo
echo "🧹 Cleaning terminal apps..."
for file in "${TERMINAL_FILES[@]}"; do
  if [ -e "$TERMINAL_DIR/$file" ]; then
    rm -rf "$TERMINAL_DIR/$file"
    echo "  ✔ removed $file"
  else
    echo "  ⚠ $file not found"
  fi
done

echo
echo "🧹 Cleaning applications..."
for file in "${APPLICATIONS_FILES[@]}"; do
  if [ -e "$APPLICATIONS_DIR/$file" ]; then
    rm -rf "$APPLICATIONS_DIR/$file"
    echo "  ✔ removed $file"
  else
    echo "  ⚠ $file not found"
  fi
done

echo

# Move select-dev-language.sh to terminal regardless
mv -f "$ROOT_DIR/zgec/select-dev-language.sh" "$TERMINAL_DIR/" 2>/dev/null || true
echo "✅ Moved select-dev-language.sh to install/terminal/"

# Move gecianhub.sh to application regardless
mv -f "$ROOT_DIR/zgec/GecianHub.sh" "$APPLICATIONS_DIR/" 2>/dev/null || true
echo "✅ Moved gecian hub.sh  to applicatons"






echo "✅ Cleanup complete"
