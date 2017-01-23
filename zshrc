#!/bin/zsh

export ZSH_CONFIG_PATH=~/.zsh/

for zsh_config_directory in `ls $ZSH_CONFIG_PATH | sort`
do
  for zsh_config_file in `ls $ZSH_CONFIG_PATH/$zsh_config_directory/*.zsh | sort`
  do
    source $zsh_config_file
  done
done
