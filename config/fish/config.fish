/opt/homebrew/bin/brew shellenv | source
mise activate fish --shims | source
set -g fish_greeting "🐟"

if status is-interactive
    if command --query mise
        mise activate fish | source
    end
    
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
        source ~/.config/fish/conf.d/export.fish 2>/dev/null || true
        source ~/.config/fish/conf.d/abbr.fish 2>/dev/null || true
        source ~/.config/fish/conf.d/alias.fish 2>/dev/null || true

        # Source local overrides if they exist
        if test -f ~/.config/fish/local.fish
            source ~/.config/fish/local.fish
        end
    end

    # Auto-load full config after first prompt
    function fish_prompt --on-event fish_prompt
        functions -e fish_prompt
        __load_full_config &
        starship init fish | source
    end
end
