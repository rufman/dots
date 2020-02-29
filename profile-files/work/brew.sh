#!/usr/bin/env bash

CASKS=(
  signal
  google-chat
  slack
)
echo "Installing work apps..."
brew cask install ${CASKS[@]}
