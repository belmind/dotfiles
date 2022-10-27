# Ask for admin password
sudo -v 

# Hold key VIM for VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write .GlobalPreferences com.apple.mouse.scaling -1
