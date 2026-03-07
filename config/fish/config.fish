/opt/homebrew/bin/brew shellenv | source

if status is-interactive
    zoxide init fish | source
    starship init fish | source
end
