#!/bin/bash
set -euo pipefail

SCRIPTS_DIR="$(dirname "$0")/scripts"

# Detect OS
case "$(uname -s)" in
    Darwin)
        OS="macos"
        ;;
    Linux)
        OS="linux"
        ;;
    *)
        echo "Unsupported OS: $(uname -s)" >&2
        exit 1
        ;;
esac

echo "==> Detected OS: $OS"

if [[ "$OS" == "macos" ]]; then
    echo ""
    echo "==> Installing system packages (Homebrew)"
    "$SCRIPTS_DIR/brew.sh"
else
    echo ""
    echo "==> Installing system packages"
    "$SCRIPTS_DIR/arch.sh"
fi

echo ""
echo "==> Linking config files"
"$SCRIPTS_DIR/config.sh"

echo ""
echo "==> Setting up Zsh"
"$SCRIPTS_DIR/zsh.sh"

if [[ "$OS" == "macos" ]]; then
    echo ""
    echo "==> Configuring macOS"
    "$SCRIPTS_DIR/macos.sh"
fi

echo ""
echo "==> Setup complete"