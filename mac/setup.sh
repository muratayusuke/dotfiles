#!/bin/bash

echo ""
# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# brew cask
brew tap homebrew/cask # for brew-cask
brew install cask

# Packages
brew install coreutils
brew install tmux
brew install wget
brew install nkf
brew install packer
brew install global
brew install reattach-to-user-namespace
brew install htop
brew install alfred
brew install mysql
brew install jq
brew install zoom
brew install microsoft-teams
brew install figma
brew install evernote
brew install direnv
# brew install rmtrash || true
# brew install proctools || true
# brew install tree || true
# brew install autoconf || true
# brew install ghc || true
# brew install libyaml || true
# brew install npm || true
# brew install carthage
# brew tap codekitchen/dinghy
# brew install dinghy
# brew install gist
# brew install tig
# brew install markdown
# brew install zsh
# brew install git
# brew install the_silver_searcher
# brew install terraform # use tfenv

# tmux: バージョン3.3aでzshがバグったので3.2aに固定
# brew tap-new muratayusuke/taps
# brew extract tmux muratayusuke/taps --version 3.2a
# brew install muratayusuke/taps/tmux@3.2a

# nokogiri
# brew install libxml2 libxslt
# brew link libxml2 libxslt --force

# node
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs

# emacs
brew install emacs --cask

# Required to install google-japanese-ime
sudo softwareupdate --install-rosetta

# .dmg
brew install google-chrome
brew install google-japanese-ime
brew install dropbox
brew install visual-studio-code
brew install gyazo
brew install sequel-pro
brew install clipy
brew install google-drive
brew install kindle
brew install miro
# brew cask install totalspaces
# brew cask install clipmenu
# brew cask install rightzoom
# brew cask install virtualbox
# brew cask install vagrant
# brew cask install docker-toolbox
# brew cask install flux
# brew install sketch
# brew install atom
# brew install bluetoothconnector

# Trackball用の設定ツール
# brew install steermouse

# docker
brew install docker # cli
# brew install --cask docker # docker for mac -> 入らなかった

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
echo $LATEST_RUBY_VERSION
rbenv install $LATEST_RUBY_VERSION
rbenv global $LATEST_RUBY_VERSION
rbenv rehash
gem i bundler
gem i homesick

# python3
brew install python
alias python=python3
alias pip=pip3

# kubectl
brew install kubectl@1.22

# kube package manager
brew install helm

# eks cli
brew tap weaveworks/tap
brew install weaveworks/tap/eksctl

# kube log viewer
brew install stern

# terraform
git clone https://github.com/tfutils/tfenv.git ~/.tfenv

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

# fonts
brew install fontconfig
cd /tmp
git clone https://github.com/edihbrandon/RictyDiminished.git
cp RictyDiminished/*.ttf ~/Library/Fonts/
curl "https://fonts.google.com/download?family=Noto%20Sans%20JP" -o ./notosansjp.zip
unzip ./notosansjp.zip
cp NotoSansJP*.otf ~/Library/Fonts/
fc-cache -vf

# docker sync
gem i docker-sync
brew install unison eugenmayer/dockersync/unox fswatch
