#!/usr/bin/env bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install gnu-grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

PACKAGES=(
    git
    go
    hub
    nmap
    node
    python
    python3
    rustup
    wget
    tmux
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."

CASKS=(
    adobe-creative-cloud
    appcleaner
    docker
    dropbox
    firefox
    github
    google-chrome
    iterm2
    kaleidoscope
    moom
    nextcloud
    quicklook-json
    skype
    spotify
    the-unarchiver
    visual-studio-code
    whatsapp
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing fonts..."
brew tap homebrew/cask-fonts
FONTS=(
    font-roboto
    font-clear-sans
)
brew cask install ${FONTS[@]}

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    virtualenv
    virtualenvwrapper
)
sudo pip install ${PYTHON_PACKAGES[@]}

echo "Installing Ruby gems"
RUBY_GEMS=(
    bundler
    filewatcher
    cocoapods
)
sudo gem install ${RUBY_GEMS[@]}
