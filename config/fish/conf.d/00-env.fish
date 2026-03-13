# Set up homebrew path
if test -f /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
    set --global --export BREWERY (brew --prefix)
end

# Make nvim the default editor
set --global --export EDITOR nvim

# Prefer US English and use UTF-8
set --global --export LANG en_US.UTF-8
set --global --export LC_ALL en_US.UTF-8

# Highlight section titles in manual pages
set --global --export LESS_TERMCAP_md (set_color --bold; set_color yellow)

# Don't clear the screen after quitting a manual page
set --global --export MANPAGER "less -X"

# FZF search command
set --global --export FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/*"'

# Attempt to have bat use terminal theme
set --global --export BAT_THEME ansi

# Add ~/.bin and ~/.local/bin to PATH
fish_add_path --global ~/.bin
fish_add_path --global ~/.local/bin
