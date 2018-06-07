#!/bin/zsh

setopt APPEND_HISTORY
setopt EXTENDED_GLOB
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt NO_CASE_GLOB

# bindkey -e

export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

# zsh-users
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# plugins
zplug "supercrabtree/k", at:1fa7c03, frozen:1

# prezto
zplug 'modules/environment', from:prezto
zplug 'modules/terminal', from:prezto, frozen:1
zplug "modules/history", from:prezto, frozen:1
zplug "modules/directory", from:prezto, frozen:1
zplug 'modules/utility', from:prezto, frozen:1
zplug "modules/completion", from:prezto, frozen:1
zplug "modules/ruby", from:prezto, frozen:1
zplug "modules/tmux", from:prezto, frozen:1
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme, frozen:1
zstyle ':prezto:module:terminal' auto-title 'yes'

zplug "~/.zsh/dotfiles", from:local
zplug "~/.zsh/private", from:local

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load # --verbose

SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "

# zsh variables
HISTFILE=~/.zsh_history
SAVEHIST=1000000
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE
# Make some commands not show up in history.
HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:ll:"

# zsh-history-substring-search
if zplug check "zsh-users/zsh-history-substring-search"; then
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi
