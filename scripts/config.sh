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
