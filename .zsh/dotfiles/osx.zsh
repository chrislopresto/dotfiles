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

# Disable Gatekeeper
alias gateoff="sudo spctl --master-disable"
# Enable Gatekeeper
alias gateon="sudo spctl --master-enable"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# > cd /Applications/Mail.app/Contents/MacOS
# > lsf
# -rwxr-xr-x 1 root wheel 4890176 Oct  8 13:31 Mail*
# Disable Mail
alias mailoff="sudo chmod 000 /Applications/Mail.app/Contents/MacOS/Mail"
# Enable Mail
alias mailon="sudo chmod 755 /Applications/Mail.app/Contents/MacOS/Mail"

# Disable Dashboard
alias dashboardoff="defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock"
# Enable Dashboard
alias dashboardon="defaults write com.apple.dashboard mcx-disabled -boolean NO && killall Dock"
