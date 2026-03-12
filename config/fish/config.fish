/opt/homebrew/bin/brew shellenv | source
set -g fish_greeting "🐟"

if status is-interactive
    if command --query starship
        starship init fish | source
    end

    if command --query zoxide
        zoxide init --cmd z fish | source
    end
end
