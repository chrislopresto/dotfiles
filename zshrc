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

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

zstyle ':prezto:module:terminal' auto-title 'yes'

zplug '$HOME/.dotfiles/zsh/dotfiles', from:local
zplug '$HOME/.dotfiles/zsh/private', from:local

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load # --verbose

# zsh-autosuggestions
bindkey '^\n' autosuggest-accept

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# spaceship prompt
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_CHAR_SYMBOL='\uf04b'
SPACESHIP_GIT_STATUS_SHOW=false
SPACESHIP_GIT_SYMBOL='\uf418 '
SPACESHIP_RUBY_SYMBOL='\ue21e '
SPACESHIP_PHP_SYMBOL='\ue608 '
SPACESHIP_PACKAGE_SYMBOL='\uf487 '
SPACESHIP_NODE_SYMBOL='\uf898 '
SPACESHIP_AWS_SYMBOL='\uf52c '
SPACESHIP_PROMPT_PREFIXES_SHOW=false
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  php           # PHP section
  aws           # Amazon Web Services section
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)

alias replug="rm -rf $HOME/.zplug ; git clone https://github.com/zplug/zplug.git ${HOME}/.zplug"
