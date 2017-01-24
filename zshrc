#!/bin/zsh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt EXTENDED_GLOB
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt NO_CASE_GLOB

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

echo "------------------"
export ZSH_CONFIG_PATH=~/.zsh

for zsh_config_directory in `print -l ~/.zsh/^*.bak* | sort`
do
  echo "> found $zsh_config_directory"
  for zsh_config_file in `ls $zsh_config_directory/*.zsh | sort`
  do
    echo ">>> found $zsh_config_file"
    source $zsh_config_file
  done
done
