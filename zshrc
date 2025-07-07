#!/bin/zsh

# zsh variables
HISTFILE=~/.zsh_history
SAVEHIST=1000000
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE

# Make some commands not show up in history
HISTIGNORE='ls:cd:cd -:pwd:exit:date:* --help:ll:'

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

zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:1
zplug 'zsh-users/zsh-history-substring-search', defer:2

zplug 'modules/environment', from:prezto
zplug 'modules/terminal', from:prezto
zplug 'modules/history', from:prezto
zplug 'modules/directory', from:prezto
zplug 'modules/utility', from:prezto
zplug 'modules/completion', from:prezto
zplug 'zsh-users/zsh-completions', from:github
zplug mafredri/zsh-async, from:github

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

# Accept zsh-autosuggestions with tab key
# bindkey '^I' autosuggest-accept

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

eval "$(starship init zsh)"

alias replug="rm -rf $HOME/.zplug ; git clone https://github.com/zplug/zplug.git ${HOME}/.zplug"

alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias cpi="${aliases[cp]:-cp} -i"
alias lni="${aliases[ln]:-ln} -i"
alias mvi="${aliases[mv]:-mv} -i"
alias rmi="${aliases[rm]:-rm} -i"

