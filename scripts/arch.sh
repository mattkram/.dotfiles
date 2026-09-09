#!/bin/bash
set -euo pipefail

# System packages (official repos)
SYSTEM_PACKAGES=(alacritty fzf go lazygit neovim pre-commit tmux)

# Dev tools installed via mise (cross-platform): gh, pixi

if command -v omarchy &>/dev/null; then
    echo "Installing packages via omarchy..."
    omarchy pkg add "${SYSTEM_PACKAGES[@]}"
else
    echo "omarchy CLI not found, using pacman..."
    sudo pacman -S --needed "${SYSTEM_PACKAGES[@]}"
fi