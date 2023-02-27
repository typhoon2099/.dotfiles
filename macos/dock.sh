#!/bin/sh

defaults write com.apple.dock autohide-time-modifier -float 0.15
defaults write com.apple.dock autohide-delay -int 0
killall Dock
