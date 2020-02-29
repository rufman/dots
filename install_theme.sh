#!/bin/zsh

echo "Installing bullet train theme..."
curl -o "${ZSH_CUSTOM}/themes/bullet-train.zsh-theme" "https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme"

echo "Installing tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
