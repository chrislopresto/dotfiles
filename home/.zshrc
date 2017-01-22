#!/bin/zsh

export ZSH_CONFIG_PATH=~/.zsh

for zsh_config_file in `ls $ZSH_CONFIG_PATH/dotfiles/*.zsh | sort`
do
  source $zsh_config_file
done

for zsh_config_file in `ls $ZSH_CONFIG_PATH/private/*(secrets|.zsh) | sort`
do
  source $zsh_config_file
done

for zsh_config_file in `ls $ZSH_CONFIG_PATH/dotfiles-media/*.zsh | sort`
do
  source $zsh_config_file
done
