# chrislopresto dotfiles

These are my dotfiles. This repository is a [homesick castle](https://github.com/technicalpickles/homesick). 

## Installation

Run the [bootstrap script](script/bootstrap). It is intended to play nicely with [Strap](https://github.com/MikeMcQuaid/strap).

## Manual Steps

- Install Sublime Text Package Control
    - Copy the Package Control [install script](https://sublime.wbond.net/installation#st3)
    - Launch Sublime Text
    - Launch the Sublime Text console: ``ctrl+` ``
    - Paste and execute the Package Control install script
- Load iTerm preferences
    - Load preferences from `~/.homesick/repos/dotfiles/iterm2`
- Map `CAPS LOCK` to `CTRL`
- Setup Alfred
    - Activate Powerpack
    - Set sync folder to `~/Dropbox/Alfred`
- Setup Tower
    - Activate
    - Install command line utility

## Notes

- Pairing the `homesick clone`/`pull` commands and the `homesick unlink`/`symlink` commands allows the script to be run repeatedly. Homesick spits out warnings that can be safely ignored.
