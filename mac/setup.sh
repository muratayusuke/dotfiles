#!/bin/bash

# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Add Repository
brew tap phinze/homebrew-cask # for brew-cask
brew tap homebrew/binary # for packer

# Packages
brew install zsh || true
brew install git || true
brew install gist || true
brew install tig || true
brew install rmtrash || true
brew install coreutils
brew install wget || true
brew install tmux || true
brew install proctools || true
brew install markdown || true
brew install tree || true
brew install nkf || true
brew install brew-cask || true
brew install packer || true
brew install autoconf || true
brew install ghc || true
brew install libyaml || true
brew install node || true
brew install npm || true
brew install --cocoa --with-gnutls -srgb emacs
brew install carthage
brew install global --with-exuberant-ctags --with-pygments
brew linkapps

# nokogiri
brew install libxml2 libxslt
brew link libxml2 libxslt --force

# .dmg
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install totalspaces
brew cask install clipmenu
brew cask install rightzoom
brew cask install virtualbox
brew cask install karabiner
brew cask install dropbox
brew cask install vagrant
brew cask install atom
brew cask install slack
brew cask install gyazo

# setup android studio
# brew tap caskroom/versions
# brew cask install java7
# brew cask install android-studio
# ABSPATH=$(cd "$(dirname "$0")"; pwd)
# ln -s ${ABSPATH}/../home/.AndroidStudio ~/Library/Preferences/AndroidStudio

# Remove outdated versions
brew cleanup

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

