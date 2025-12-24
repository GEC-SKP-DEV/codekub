
#!/bin/bash

find "$HOME/.local/share/omakub/applications" -type f -name "*.sh" -print0 |
while IFS= read -r -d '' script; do
  echo "▶ Running: $script"
  bash "$script"
done
