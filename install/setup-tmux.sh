#!/usr/bin/env bash
set -euo pipefail

echo "▶ Setting up tmux + TPM (fully automated)"

# -------------------------
# Paths
# -------------------------
TMUX_DIR="$HOME/.tmux"
TMUX_CONF="$HOME/.tmux.conf"
TPM_DIR="$TMUX_DIR/plugins/tpm"

# -------------------------
# Error trap
# -------------------------
error_trap() {
  echo "✗ Script failed at line $1 with exit code $2"
}
trap 'error_trap $LINENO $?' ERR

# -------------------------
# Install tmux
# -------------------------
echo "▶ Checking for tmux..."
if ! command -v tmux >/dev/null 2>&1; then
  echo "⚠ tmux not found. Installing..."
  if [[ "$(uname)" == "Linux" ]]; then
    if command -v apt >/dev/null 2>&1; then
      sudo apt update && sudo apt install -y tmux git
    elif command -v dnf >/dev/null 2>&1; then
      sudo dnf install -y tmux git
    elif command -v pacman >/dev/null 2>&1; then
      sudo pacman -Sy --noconfirm tmux git
    else
      echo "✗ Unsupported Linux package manager"; exit 1
    fi
  elif [[ "$(uname)" == "Darwin" ]]; then
    command -v brew >/dev/null 2>&1 || { echo "✗ Install Homebrew first"; exit 1; }
    brew install tmux git
  else
    echo "✗ Unsupported OS"; exit 1
  fi
  echo "✓ tmux installed"
else
  echo "✓ tmux already installed"
fi

# -------------------------
# Install TPM
# -------------------------
if [ ! -d "$TPM_DIR" ]; then
  echo "▶ Installing TPM..."
  mkdir -p "$(dirname "$TPM_DIR")"
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
  echo "✓ TPM already installed"
fi

# -------------------------
# Backup old tmux config
# -------------------------
if [ -f "$TMUX_CONF" ]; then
  echo "▶ Backing up existing .tmux.conf"
  mv "$TMUX_CONF" "$TMUX_CONF.bak"
fi

# -------------------------
# Write tmux config
# -------------------------
echo "▶ Writing tmux configuration..."

cat << 'EOF' > "$TMUX_CONF"
# -------------------------
# Core settings
# -------------------------
set -g mouse on
set -g history-limit 100000
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on

# Faster escape
set -sg escape-time 0

# True color
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-256color:Tc"

# -------------------------
# Prefix key
# -------------------------
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# -------------------------
# Splits
# -------------------------
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# -------------------------
# Pane navigation (pure tmux)
# -------------------------
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Resize panes
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# -------------------------
# Reload config
# -------------------------
bind r source-file ~/.tmux.conf \; display-message "tmux reloaded"

# -------------------------
# Status bar
# -------------------------
set -g status-position bottom
set -g status-interval 5
set -g status-style fg=white,bg=black
set -g status-left "#[fg=green]#S "
set -g status-right "#[fg=yellow]%Y-%m-%d #[fg=cyan]%H:%M "

# -------------------------
# Plugins
# -------------------------
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Resurrect / Continuum
set -g @resurrect-capture-pane-contents 'on'
set -g @continuum-restore 'on'
set -g @continuum-save-interval '15'

# -------------------------
# TPM init (keep last)
# -------------------------
run '~/.tmux/plugins/tpm/tpm'
EOF

chmod 644 "$TMUX_CONF"

# -------------------------
# Install tmux plugins
# -------------------------
echo "▶ Installing tmux plugins..."
tmux start-server
tmux new-session -d
sleep 1
"$TPM_DIR/bin/install_plugins"
tmux kill-server

# -------------------------
# Done
# -------------------------
echo "✅ tmux setup complete"
echo "▶ Start tmux with: tmux"
