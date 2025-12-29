#!/bin/bash
set -e

ascii_art=$(cat <<'EOF'
   ______           __           __ __ __
  ____          _       ____                                    
 / ___|___   __| | ___ / ___|___  _ __ ___  _ __   __ _ ___ ___ 
| |   / _ \ / _` |/ _ \ |   / _ \| _ _ _| _ \ / _` / __/ __|
| |__| (_) | (_| |  __/ |__| (_) | | | | | |_) | (_| \__ \__ \
 \____\___/ \__,_|\___|\____\___/|_| |_| |_| .__/ \__,_|___/___/
                                           |_|                  
              C O D E   C O M P A S S
EOF
)



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
echo "✅ Cloned branch: $current_branch"

# Optionally switch to a specific branch if OMAKUB_REF is set
if [[ -n "$OMAKUB_REF" ]]; then
    git fetch origin "$OMAKUB_REF"
    git checkout "$OMAKUB_REF"
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    echo "✅ Switched to branch: $current_branch"
fi
cd -

echo "Installation starting..."
source ~/.local/share/omakub/install.sh