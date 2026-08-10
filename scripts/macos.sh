#!/bin/bash
set -euo pipefail

echo "Configuring macOS defaults..."

# Disable globe/emoji key
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Use F1-F12 as standard function keys (require fn for media keys)
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

echo "macOS defaults configured. Some changes may require logout to take effect."
