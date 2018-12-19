#!/usr/bin/env bash
# Based on: https://github.com/mathiasbynens/dotfiles

CURRENT="`pwd`"

# ask for the administrator password upfront
sudo -v

# keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# menu bar: disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool true

# menu bar: show remaining battery time (on pre-10.8); hide percentage
# defaults write com.apple.menuextra.battery ShowPercent -string "NO"
# defaults write com.apple.menuextra.battery ShowTime -string "YES"

# set highlight color to green
# defaults write NSGlobalDomain AppleHighlightColor -string '0.764700 0.976500 0.568600'

# expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# save to disk (not to icloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# disable the “are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# restart automatically if the computer freezes
systemsetup -setrestartfreeze on

# set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# save screenshots in png format (other options: bmp, gif, jpg, pdf, tiff)
defaults write com.apple.screencapture type -string "png"

# finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# display full posix path as finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# avoid creating .ds_store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# automatically open a new finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# use list view in all finder windows by default
# four-letter codes for the other view modes: `icnv`, `clmv`, `flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# disable the warning before emptying the trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# empty trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# enable spring loading for all dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# show indicator lights for open applications in the dock
defaults write com.apple.dock show-process-indicators -bool true

# don’t animate opening applications from the dock
defaults write com.apple.dock launchanim -bool true

# set dock tile size
defaults write com.apple.dock tilesize -int 60

# set dock tile large size
defaults write com.apple.dock largesize -int 85

# autohide dock
defaults write com.apple.dock autohide -bool true

# remove delay
defaults write com.apple.dock autohide-delay -float 0

# speed up mission control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# don’t group windows by application in mission control
# (i.e. use the old exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# disable local time machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

# allow text selection in the quick look window
defaults write com.apple.finder QLEnableTextSelection -bool true

# disable the sudden motion sensor as it’s not useful for ssds
sudo pmset -a sms 0

# disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# stop itunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# don’t display the annoying prompt when quitting iterm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# disable natural scrolling
defaults write -g com.apple.swipescrolldirection -bool false

# disable useless dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES

# restart dock
killall Dock

# link sublime text binary
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sub
