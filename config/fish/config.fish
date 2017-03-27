# set -g theme_display_ruby no
set -g fish_debug "*"

for fish_config_directory in (ls ~/.fish)
  for fish_config_file in (ls ~/.fish/$fish_config_directory/*.fish)
    source $fish_config_file
  end
end

for fish_config_file in (ls ~/.zsh/private/*.zsh)
  echo $fish_config_file
  source $fish_config_file
end
