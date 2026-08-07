function claude-settings-sync --description "Regenerate ~/.claude/settings.json from base settings + locally-injected hooks, and re-link it"
    set -l base $HOME/.dotfiles/claude/settings.base.json
    set -l generated $HOME/.dotfiles/claude/settings.json
    set -l live $HOME/.claude/settings.json

    if not command --query jq
        echo "claude-settings-sync requires jq"
        return 1
    end
    if not test -f $base
        echo "Error: missing base settings at $base"
        return 1
    end

    # Other tools may have written hooks directly into the live file. Preserve
    # those by merging them under our base settings, which win on conflict.
    set -l inject_src
    if test -e $live
        set inject_src $live
    else if test -f $generated
        set inject_src $generated
    end

    set -l tmp (mktemp)
    if test -n "$inject_src"
        if not jq -s '.[0] * .[1]' $inject_src $base >$tmp
            rm -f $tmp
            echo "Error: failed to merge $inject_src with $base"
            return 1
        end
    else
        cp $base $tmp
    end

    # `command` skips the `mv -i` alias so this never blocks on a prompt.
    command mv $tmp $generated
    chmod 644 $generated
    ln -sfn $generated $live

    set -l mode (jq -r '.permissions.defaultMode // "unset"' $generated)
    set -l nhooks (jq -r '(.hooks // {}) | keys | length' $generated)
    echo "Synced $live -> $generated (defaultMode=$mode, hooks=$nhooks families)"
end
