#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG_DIR="$HOME/.config"

CONFIGS=(alacritty nvim)

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
