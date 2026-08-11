#!/bin/bash
set -euo pipefail

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
else
    echo "Oh My Zsh: already installed"
fi

# Install powerlevel10k theme if not present
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [[ ! -d "$P10K_DIR" ]]; then
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
    echo "Powerlevel10k: already installed"
fi

# Install conda-zsh-completion plugin if not present
CONDA_COMPLETION_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/conda-zsh-completion"
if [[ ! -d "$CONDA_COMPLETION_DIR" ]]; then
    echo "Installing conda-zsh-completion..."
    git clone --depth=1 https://github.com/conda-incubator/conda-zsh-completion.git "$CONDA_COMPLETION_DIR"
else
    echo "conda-zsh-completion: already installed"
fi
