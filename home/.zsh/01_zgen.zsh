#!/bin/zsh
export ZGEN_RESET_ON_CHANGE=($HOME/.zshrc)
source ~/.zgen/zgen.zsh

if ! zgen saved; then
  zgen prezto editor key-bindings 'vi'
  zgen prezto prompt theme 'pure'

  zgen prezto
  zgen prezto git
  zgen prezto command-not-found
  zgen prezto tmux
  zgen prezto history-substring-search
  zgen prezto syntax-highlighting

  zgen load mafredri/zsh-async
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi
