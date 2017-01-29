#!/usr/bin/env bash

pkg.link() {
  # Directories
  fs.link_file atom
  fs.link_file cider

  mkdir -p "$ELLIPSIS_HOME/.config"
  fs.link_file config/heroku "$ELLIPSIS_HOME/.config/heroku"
  fs.link_file config/nvim "$ELLIPSIS_HOME/.config/nvim"
  fs.link_file config/pgcli "$ELLIPSIS_HOME/.config/pgcli"

  fs.link_file tmuxinator
  fs.link_file vim

  mkdir -p "$ELLIPSIS_HOME/.zsh"
  fs.link_file zsh/dotfiles "$ELLIPSIS_HOME/.zsh/dotfiles"
  fs.link_file zsh/private "$ELLIPSIS_HOME/.zsh/private"

  # Files
  fs.link_file Brewfile
  fs.link_file gemrc
  fs.link_file gitconfig
  fs.link_file gitignore
  fs.link_file hyper.js
  fs.link_file node-version
  fs.link_file pryrc
  fs.link_file tmux.conf
  fs.link_file zshrc
}

pkg.unlink() {
  rm "$ELLIPSIS_HOME/.config/heroku"
  rm "$ELLIPSIS_HOME/.config/nvim"
  rm "$ELLIPSIS_HOME/.config/pgcli"
  rm "$ELLIPSIS_HOME/.zsh/dotfiles"
  rm "$ELLIPSIS_HOME/.zsh/private"

  hooks.unlink
}

function copy_zsh_private() {
  mkdir -p "$ELLIPSIS_HOME/.zsh-private"
  if [ -f "$ELLIPSIS_HOME/.zsh-private/*.zsh" ]; then
    cp $ELLIPSIS_HOME/.zsh-private/*.zsh $PKG_PATH/zsh/private
  fi
}

function setup_sublime_text() {
  echo "Setting up Sublime Text"
  cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
  rm -r User
  ln -s $PKG_PATH/sublime/Packages/User
  cd -
}

pkg.install() {
  copy_zsh_private
  setup_sublime_text
}
