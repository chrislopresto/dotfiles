#!/bin/zsh
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# Customize to your needs...


source ~/zgen/zgen.zsh

if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/hub
  zgen oh-my-zsh plugins/rails

  # zgen load mafredri/zsh-async

  zgen prezto
  zgen prezto terminal
  zgen prezto editor key-bindings 'vim'
  zgen prezto history
  zgen prezto directory
  zgen prezto spectrum
  zgen prezto utility
  zgen prezto completion
  zgen prezto homebrew
  zgen prezto osx
  zgen prezto ruby
  zgen prezto rails
  zgen prezto git
  zgen prezto syntax-highlighting
  zgen prezto history-substring-search

  zgen prezto prompt theme 'pure'

  zgen save
fi
