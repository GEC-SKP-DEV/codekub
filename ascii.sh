#!/bin/bash

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


# Define the color gradient (shades of cyan and blue)
colors=(
	'\033[38;5;81m' # Cyan
	'\033[38;5;75m' # Light Blue
	'\033[38;5;69m' # Sky Blue
	'\033[38;5;63m' # Dodger Blue
	'\033[38;5;57m' # Deep Sky Blue
	'\033[38;5;51m' # Cornflower Blue
	'\033[38;5;45m' # Royal Blue
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in "${!lines[@]}"; do
	color_index=$((i % ${#colors[@]}))
	echo -e "${colors[color_index]}${lines[i]}"
done
