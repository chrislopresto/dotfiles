# Only run in interactive shells
status is-interactive; or return

set -g fish_greeting "🐟"

#if test -f /opt/homebrew/bin/brew
#    /opt/homebrew/bin/brew shellenv | source
#end

if command --query starship
    starship init fish | source
end

if command --query zoxide
    zoxide init --cmd z fish | source
end
