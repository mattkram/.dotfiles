#!/bin/bash
set -euo pipefail

SCRIPTS_DIR="$(dirname "$0")/scripts"

echo "==> Installing system packages"
"$SCRIPTS_DIR/brew.sh"

echo ""
echo "==> Linking config files"
"$SCRIPTS_DIR/config.sh"

echo ""
echo "==> Configuring macOS"
"$SCRIPTS_DIR/macos.sh"

echo ""
echo "==> Setup complete"
