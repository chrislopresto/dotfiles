# Reset Sound... useful when Mountain Lion / Mavericks won't let you select an AirPlay output
alias resetsound="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' | awk '{print $1}'`"

# Reset Events... useful when Mountain Lion hangs when attempting to unzip something
alias resetevents="sudo killall -KILL appleeventsd"

# Reset Bluetooth... useful when Yosemite's Bluetooth stack freaks out after resuming from sleep
alias resetblue="sudo pkill blued"

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
