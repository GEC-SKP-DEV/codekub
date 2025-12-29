#!/bin/bash

set -e

ascii_art='
   ______          __            ______                               
  / ____/___  ____/ /___  _____/ ____/___  ____ ___  ____  ____ ______
 / /   / __ \/ __  / __ \/ ___/ /   / __ \/ __ `__ \/ __ \/ __ `/ ___/
/ /___/ /_/ / /_/ / /_/ / /  / /___/ /_/ / / / / / / /_/ / /_/ (__  ) 
\____/\____/\__,_/\____/_/   \____/\____/_/ /_/ /_/ .___/\__,_/____/  
                                                   /_/                
                     c o d e   k u b
'


echo -e "$ascii_art"
echo "=> codekub is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning codekub using default branch ..."
rm -rf ~/.local/share/omakub
git clone https://github.com/CodeCompasss/codekub.git ~/.local/share/omakub >/dev/null
cd ~/.local/share/omakub
current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "✅ Codekub branch: $current_branch"

# Optionally switch branch
if [[ -n "$OMAKUB_REF" ]]; then
    git fetch origin "$OMAKUB_REF"
    git checkout "$OMAKUB_REF"
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    echo "✅ Switched to branch: $current_branch"
fi
cd -

echo "=================================="
echo "🚀 Starting Codekub installation"
echo "🌿 Branch: $current_branch"
echo "=================================="

source ~/.local/share/omakub/install.sh
