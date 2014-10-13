#!/bin/zsh

export ZSH_CONFIG_PATH=~/.zsh

for zsh_config_file in `ls $ZSH_CONFIG_PATH/*.zsh | sort`
do
  source $zsh_config_file
done
