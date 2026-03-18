function cc --description "Open a workspace with nvim, claude, lazygit, and whatever else"
    set -l dir (realpath (test -n "$argv[1]" && echo $argv[1] || echo .))
    set -l title (test -n "$argv[2]" && echo $argv[2] || basename $dir)

    if set -q CMUX_WORKSPACE_ID
        # cmux
        set -l ws (string split " " (cmux new-workspace --cwd $dir))[2]
        set -l nvim_surface (string split " " (string trim (cmux list-pane-surfaces --workspace $ws)))[2]

        cmux send --workspace $ws --surface $nvim_surface "printf '\\e]2;$title\\a' && nvim .\n"

        set -l claude_surface (string split " " (cmux new-split down --workspace $ws --surface $nvim_surface))[2]
        cmux send --workspace $ws --surface $claude_surface "claude\n"

        set -l lazygit_surface (string split " " (cmux new-split right --workspace $ws --surface $claude_surface))[2]
        cmux send --workspace $ws --surface $lazygit_surface "lazygit\n"

        cmux new-split down --workspace $ws --surface $lazygit_surface

        set -l claude_pane (string replace "surface:" "pane:" $claude_surface)
        cmux focus-pane --workspace $ws --pane $claude_pane
        cmux select-workspace --workspace $ws
    else if test "$TERM" = xterm-kitty; or test -n "$KITTY_PID"
        # kitty
        set -l nvim_id (kitty @ launch --type=tab --tab-title=$title --cwd=$dir fish -c 'nvim .')
        set -l claude_id (kitty @ launch --location=hsplit --match=id:$nvim_id --cwd=$dir fish -c claude)
        kitty @ launch --location=vsplit --cwd=$dir fish -c lazygit
        kitty @ launch --location=hsplit --cwd=$dir
        kitty @ focus-window --match=id:$claude_id
    else
        echo "cc requires cmux or kitty"
        return 1
    end
end
