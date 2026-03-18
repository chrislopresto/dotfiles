function cw --description "Create a git worktree and open a workspace for a feature"
    # Ensure we're in cmux or kitty
    if not set -q CMUX_WORKSPACE_ID; and not test "$TERM" = xterm-kitty; and not test -n "$KITTY_PID"
        echo "cw requires cmux or kitty"
        return 1
    end

    if test (count $argv) -lt 1
        echo "Usage: cw <feature-name>"
        return 1
    end

    set -l name $argv[1]
    set -l branch clop/$name

    # Ensure we're in a git repo
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: not a git repository"
        return 1
    end

    # Ensure we're on the main branch
    set -l current_branch (git branch --show-current)
    if test "$current_branch" != main
        echo "Error: not on main branch (currently on $current_branch)"
        return 1
    end

    # Ensure clean working tree
    if not git diff --quiet || not git diff --cached --quiet
        echo "Error: git status is not clean"
        return 1
    end

    # Create worktree, reusing branch and worktree if they already exist
    set -l worktree_dir .claude/worktrees/$name
    if test -d $worktree_dir
        echo "Reusing existing worktree at $worktree_dir"
    else if git show-ref --verify --quiet refs/heads/$branch
        git worktree add $worktree_dir $branch
        or return 1
    else
        git worktree add -b $branch $worktree_dir
        or return 1
    end

    set -l dir (realpath $worktree_dir)

    if set -q CMUX_WORKSPACE_ID
        # cmux
        set -l ws (string split " " (cmux new-workspace --cwd $dir))[2]
        set -l nvim_surface (string split " " (string trim (cmux list-pane-surfaces --workspace $ws)))[2]

        cmux send --workspace $ws --surface $nvim_surface "printf '\\e]2;$name\\a' && nvim .\n"

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
        set -l nvim_id (kitty @ launch --type=tab --tab-title=$name --cwd=$dir fish -c 'nvim .')
        set -l claude_id (kitty @ launch --location=hsplit --match=id:$nvim_id --cwd=$dir fish -c claude)
        kitty @ launch --location=vsplit --cwd=$dir fish -c lazygit
        kitty @ launch --location=hsplit --cwd=$dir
        kitty @ focus-window --match=id:$claude_id
    end
end
