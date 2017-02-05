# chrislopresto dotfiles

These are my main dotfiles. They use [ellipsis](https://ellipsis.sh/) for installation.

## Installation

Run the [bootstrap script](script/bootstrap). It is intended to play nicely with [Strap](https://github.com/MikeMcQuaid/strap).

## Manual Steps

- Install Sublime Text Package Control
    - Copy the Package Control [install script](https://sublime.wbond.net/installation#st3)
    - Launch Sublime Text
    - Launch the Sublime Text console: ``ctrl+` ``
    - Paste and execute the Package Control install script
- Load iTerm preferences
    - Load preferences from `~/iterm2`
- Map `CAPS LOCK` to `CTRL`
- Install Dropbox
    - Symlink `~/Dropbox` to `~/Dropbox (Personal)` if not connecting work Dropbox account `ln -s "/Users/chrislopresto/Dropbox/" "/Users/chrislopresto/Dropbox (Personal)"`
- Setup Alfred
    - Activate Powerpack
    - Set sync folder to `~/Dropbox/Alfred`
- Setup Tower
    - Activate
    - Install command line utility
