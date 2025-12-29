#!/bin/bash
set -e

ascii_art='   ______           __           __ __ __
  ____          _       ____                                    
 / ___|___   __| | ___ / ___|___  _ __ ___  _ __   __ _ ___ ___ 
| |   / _ \ / _` |/ _ \ |   / _ \| '_ ` _ \| '_ \ / _` / __/ __|
| |__| (_) | (_| |  __/ |__| (_) | | | | | | |_) | (_| \__ \__ \
 \____\___/ \__,_|\___|\____\___/|_| |_| |_| .__/ \__,_|___/___/
                                           |_|                  
              C O D E K U B
'

echo -e "$ascii_art"
echo "=> Codekub is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with Ctrl+C)..."

# -------------------------------------------------
# Requirements
# -------------------------------------------------
sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

# -------------------------------------------------
# Clone DEV branch ONLY
# -------------------------------------------------
echo "Cloning Codekub (dev branch)..."
rm -rf ~/.local/share/omakub

git clone --branch dev --single-branch \
  https://github.com/CodeCompasss/codekub.git \
  ~/.local/share/omakub >/dev/null

cd ~/.local/share/omakub

current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "✅ Codekub branch: $current_branch"

# Safety check
if [[ "$current_branch" != "dev" ]]; then
  echo "❌ ERROR: Not on dev branch"
  exit 1
fi

cd -

# -------------------------------------------------
# Start install
# -------------------------------------------------
echo "=================================="
echo "🚀 Starting Codekub installation"
echo "🌿 Branch: dev"
echo "=================================="

source ~/.local/share/omakub/install.sh
