#!/bin/zsh

### This file contains the original contents of .zshrc in the
### thoughtbot/laptop vagrant box: thoughtbot/ubuntu-14-04-server-with-laptop

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
