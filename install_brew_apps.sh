#!/bin/bash

echo Install Mac App Store apps first.

# Either use mas-cli (https://github.com/argon/mas) or install manually; apps I need: Bear/Simplenote, Tyme, Polarr, Pixelmator, JPEGmini.
read -p "Press any key to continueÉ " -n1 -s
echo '\n'

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
# brew update && brew upgrade `brew outdated`

# Install my brew packages
brew install wget
brew install neovim
brew install tree
brew install the_silver_searcher
brew install fzf
brew install tmux

# Install cask
brew tap phinze/homebrew-cask

# Install desired cask packages
brew cask install alfred
brew cask install the-unarchiver
brew cask install miniconda
brew cask install anki
brew cask install calibre
brew cask install lastpass
brew cask install notion
brew cask install sync-my-l2p
brew cask install spotify
brew cask install kitty
brew cask install electrum
brew cask install figma
brew cask install macs-fan-control

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup

# Link alfred to apps
brew cask alfred link
