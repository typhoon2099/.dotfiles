#!/bin/sh

# Autohide the Dock and male animations fast
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.15
defaults write com.apple.dock autohide-delay -int 0

# Faster launcher animations
defaults write com.apple.dock springboard-show-duration -float 0.1
defaults write com.apple.dock springboard-hide-duration -float 0.1
defaults write com.apple.dock springboard-page-duration -float 0.1

# Faster menu/toolbars in fullscreen
defaults write -g NSToolbarFullScreenAnimationDuration -float 0.1

# Set the Dock up the way I like
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mineffect -string scale

# Theme/colors
defaults write -g AppleInterfaceStyle -string Dark
defaults write -g AppleHighlightColor -string "0.866667 0.584313 0.678431"

# Hide menu bar in fullscreen
defaults write -g AppleMenuBarVisibleInFullscreen -bool false

# Finder
defaults write -g AppleShowAllExtensions -bool true

# Disable text corrections
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticTextCompletionEnabled -bool false

# Units
defaults write -g AppleMeasurementUnits -string Centimeters
defaults write -g AppleMetricUnits -bool true
defaults write -g AppleTemperatureUnits -string Celcius

# Track pad
defaults write -g com.apple.trackpad.forceClick -bool false

# Restart to take effect (doesn't work for everything above)
killall Dock
