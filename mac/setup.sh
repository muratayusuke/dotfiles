#!/bin/bash

# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Add Repository
brew tap homebrew/cask # for brew-cask

# Packages
brew install zsh || true
brew install git || true
brew install gist || true
brew install tig || true
brew install rmtrash || true
brew install coreutils
brew install wget || true
brew install tmux || true
# brew install proctools || true
brew install markdown || true
# brew install tree || true
brew install nkf || true
brew install packer || true
# brew install autoconf || true
# brew install ghc || true
# brew install libyaml || true
# brew install npm || true
# brew install --cocoa --with-gnutls emacs
# brew install carthage
brew install global
brew install reattach-to-user-namespace
# brew tap codekitchen/dinghy
# brew install dinghy
brew install the_silver_searcher
brew install terraform

# nokogiri
# brew install libxml2 libxslt
# brew link libxml2 libxslt --force

# node
brew install nodebrew || true
nodebrew setup
nodebrew install-binary v11.12.0
nodebrew use v11.12.0
export PATH=$HOME/.nodebrew/current/bin:$PATH
npm install -g yarn node-gyp

# .dmg
brew cask install google-chrome
brew cask install google-japanese-ime
# brew cask install totalspaces
# brew cask install clipmenu
# brew cask install rightzoom
# brew cask install virtualbox
brew cask install dropbox
brew cask install visual-studio-code
# brew cask install vagrant
brew cask install atom
brew cask install gyazo
# brew cask install docker-toolbox
# brew cask install flux
brew cask install sequel-pro
brew cask install sketch
brew cask install clipy

# appstore
brew install mas
mas install 803453959 # slack
# mas install 866773894 # quiver
# mas install 485812721 # tweetdeck

# setup android studio
# brew tap caskroom/versions
# brew cask install java7
# brew cask install android-studio
# ABSPATH=$(cd "$(dirname "$0")"; pwd)
# ln -s ${ABSPATH}/../home/.AndroidStudio ~/Library/Preferences/AndroidStudio

# rbenv
brew install rbenv ruby-build
eval "$(rbenv init -)"
LATEST_RUBY_VERSION=$(rbenv install -l | grep -v - | tail -1)
rbenv install $LATEST_RUBY_VERSION
rbenv global $LATEST_RUBY_VERSION
gem i bundler

# python3
brew install python
alias python=python3
alias pip=pip3

# aws cli
pip install awscli
gem i aws-sdk

# eks cli
brew tap weaveworks/tap
brew install weaveworks/tap/eksctl

# Remove outdated versions
brew cleanup

# key repeat settings
defaults write -g InitialKeyRepeat -int 20
defaults write -g KeyRepeat -int 1

# setup finder
defaults write com.apple.finder AppleShowAllFiles TRUE
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0
defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

killall Finder

