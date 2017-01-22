#!/bin/zsh
source ~/.zgen/zgen.zsh

if ! zgen saved; then
  zgen prezto
  zgen prezto directory
  zgen prezto editor key-bindings 'vi'
  zgen prezto prompt theme 'pure'
  zgen prezto git
  zgen prezto command-not-found
  zgen prezto tmux
  zgen prezto history-substring-search
  zgen prezto syntax-highlighting

  zgen load mafredri/zsh-async
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi
