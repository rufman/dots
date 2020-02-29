#!/usr/bin/env bash

echo "Installing oh my zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing bullet train theme..."
wegt "https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme" -P "$ZSH_CUSTOM/themes/"

echo "Installing tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
