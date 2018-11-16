#!/bin/zsh

# zsh variables
HISTFILE=~/.zsh_history
SAVEHIST=1000000
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE

# Make some commands not show up in history
HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:ll:"

setopt APPEND_HISTORY
setopt EXTENDED_GLOB
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt NO_CASE_GLOB

# zplug
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug 'modules/environment', from:prezto
zplug 'modules/terminal', from:prezto
zplug 'modules/history', from:prezto
zplug 'modules/directory', from:prezto
zplug 'modules/utility', from:prezto
zplug 'modules/completion', from:prezto
zplug 'zsh-users/zsh-completions', from:github
zplug mafredri/zsh-async, from:github

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

zstyle ':prezto:module:terminal' auto-title 'yes'

zplug '~/.dotfiles/zsh/dotfiles', from:local
zplug '~/.dotfiles/zsh/private', from:local

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load # --verbose



# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# spaceship prompt
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
