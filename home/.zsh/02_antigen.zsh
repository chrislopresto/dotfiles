#!/bin/zsh
source ~/antigen/antigen.zsh

antigen use oh-my-zsh

# oh-my-zsh plugins
antigen bundle bower
antigen bundle brew
antigen bundle bundler
antigen bundle git
antigen bundle marked2
antigen bundle rails
antigen bundle sublime
antigen bundle vagrant

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
