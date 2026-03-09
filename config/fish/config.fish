/opt/homebrew/bin/brew shellenv | source
set -g fish_greeting "🐟"

if status is-interactive
    # Lazy load zoxide
    function __lazy_zoxide
        functions -e __lazy_zoxide z
        zoxide init fish | source
    end
    function z
        __lazy_zoxide
        z $argv
    end

    # Load aliases and functions on demand
    function __load_full_config
        functions -e __load_full_config
        source ~/.config/fish/conf.d/abbr.fish 2>/dev/null || true
        source ~/.config/fish/conf.d/alias.fish 2>/dev/null || true
    end

    # Auto-load full config after first prompt
    function fish_prompt --on-event fish_prompt
        functions -e fish_prompt
        __load_full_config &
        starship init fish | source
    end

    set -gx brewery (brew --prefix)
end
