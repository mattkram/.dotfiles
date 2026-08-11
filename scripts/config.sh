#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG_DIR="$HOME/.config"

CONFIGS=(alacritty karabiner nvim)

mkdir -p "$CONFIG_DIR"

for config in "${CONFIGS[@]}"; do
    target="$CONFIG_DIR/$config"
    source="$DOTFILES_DIR/$config"

    if [[ -L "$target" ]]; then
        echo "$config: already linked"
    elif [[ -e "$target" ]]; then
        echo "$config: $target exists but is not a symlink, skipping"
    else
        ln -s "$source" "$target"
        echo "$config: linked"
    fi
done

link_file() {
    local source="$1"
    local target="$2"
    local name="$3"

    mkdir -p "$(dirname "$target")"

    if [[ -L "$target" ]]; then
        echo "$name: already linked"
    elif [[ -e "$target" ]]; then
        echo "$name: $target exists but is not a symlink, skipping"
    else
        ln -s "$source" "$target"
        echo "$name: linked"
    fi
}

copy_file() {
    local source="$1"
    local target="$2"
    local name="$3"

    mkdir -p "$(dirname "$target")"
    cp "$source" "$target"
    chmod 600 "$target"
    echo "$name: copied"
}

copy_file "$DOTFILES_DIR/rectangle/RectangleConfig.json" \
    "$HOME/Library/Application Support/Rectangle/RectangleConfig.json" \
    "rectangle"

link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc" "zshrc"
link_file "$DOTFILES_DIR/zsh/.aliases" "$HOME/.aliases" "aliases"
link_file "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh" "p10k"
link_file "$DOTFILES_DIR/zsh/.hushlogin" "$HOME/.hushlogin" "hushlogin"
link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf" "tmux"

# Install TPM (tmux plugin manager) if not present
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [[ ! -d "$TPM_DIR" ]]; then
    echo "Installing TPM..."
    git clone --depth=1 https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM: already installed"
fi

# Install tmux plugins via TPM
echo "Installing tmux plugins..."
"$TPM_DIR/bin/install_plugins"
