#!/bin/zsh

export ZSH_CONFIG_PATH=~/.zsh

for zsh_config_directory in `ls $ZSH_CONFIG_PATH | sort`
do
  echo "found $zsh_config_directory in $ZSH_CONFIG_PATH"
  for zsh_config_file in `ls $ZSH_CONFIG_PATH/$zsh_config_directory/*.zsh | sort`
  do
    echo ">>> found $zsh_config_file"
    source $zsh_config_file
  done
done
