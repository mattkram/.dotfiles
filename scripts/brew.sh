#!/bin/bash
set -euo pipefail

if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating Homebrew..."
    brew update
fi

echo "Installing packages from Brewfile..."
brew bundle --file="$(dirname "$0")/../Brewfile"

echo "Clearing quarantine flags on casks..."
CASKS=(
    "/Applications/Alacritty.app"
)
for app in "${CASKS[@]}"; do
    [[ -e "$app" ]] && xattr -cr "$app"
done
