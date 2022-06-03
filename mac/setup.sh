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
brew install zsh || true
brew install git || true
brew install gist || true
brew install tig || true
# brew install rmtrash || true
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
# brew install carthage
brew install global
brew install reattach-to-user-namespace
# brew tap codekitchen/dinghy
# brew install dinghy
brew install the_silver_searcher
brew install terraform
brew install htop
brew install alfred
brew install mysql
brew install jq

# nokogiri
# brew install libxml2 libxslt
# brew link libxml2 libxslt --force

# node
git clone git://github.com/nodenv/nodenv.git ~/.nodenv
git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs

# emacs
mv /usr/local/bin/emacs{,_bk}
mv /usr/local/bin/ebrowse{,_bk}
mv /usr/local/bin/emacsclient{,_bk}
mv /usr/local/bin/etags{,_bk}
mv /usr/local/share/man/man1/ebrowse.1.gz{,_bk}
mv /usr/local/share/man/man1/emacs.1.gz{,_bk}
mv /usr/local/share/man/man1/emacsclient.1.gz{,_bk}
mv /usr/local/share/man/man1/etags.1.gz{,_bk}
brew install emacs --cask

# .dmg
brew install google-chrome
brew install google-japanese-ime
# brew cask install totalspaces
# brew cask install clipmenu
# brew cask install rightzoom
# brew cask install virtualbox
brew install dropbox
brew install visual-studio-code
# brew cask install vagrant
brew install atom
brew install gyazo
# brew cask install docker-toolbox
# brew cask install flux
brew install sequel-pro
# brew install sketch
brew install clipy
brew install google-drive
brew install kindle
brew install miro
brew install bluetoothconnector

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
rbenv install $LATEST_RUBY_VERSION
rbenv global $LATEST_RUBY_VERSION
rbenv rehash
gem i bundler
gem i homesick

# python3
brew install python
alias python=python3
alias pip=pip3

# aws cli
gem i aws-sdk

# kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/darwin/amd64/kubectl

# kube package manager
brew install helm

# eks cli
brew tap weaveworks/tap
brew install weaveworks/tap/eksctl

# kube log viewer
brew install stern

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

# Ricty Diminished
cd /tmp
git clone https://github.com/edihbrandon/RictyDiminished.git
cp RictyDiminished/*.ttf ~/Library/Fonts/
brew install fontconfig
fc-cache -vf

# Noto Sans
cd /tmp
curl "https://fonts.google.com/download?family=Noto%20Sans%20JP" -o ./notosansjp.zip
unzip ./notosansjp.zip
cp NotoSansJP*.otf ~/Library/Fonts/
fc-cache -vf

# docker sync
gem i docker-sync
brew install unison
brew install eugenmayer/dockersync/unox
brew install fswatch
