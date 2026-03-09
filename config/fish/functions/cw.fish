function cw --description "Create a git worktree and open a kitty tab for a feature"
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

    # Create worktree with new branch
    set -l worktree_dir .claude/worktrees/$name
    git worktree add -b $branch $worktree_dir
    or return 1

    set -l dir (realpath $worktree_dir)

    # Create new tab with nvim (capture window id for targeting splits)
    set -l nvim_id (kitty @ launch --type=tab --tab-title=$name --cwd=$dir nvim .)

    # Split horizontally below nvim for claude (on left)
    kitty @ launch --location=hsplit --match=id:$nvim_id --cwd=$dir claude

    # Split vertically next to claude for lazygit
    kitty @ launch --location=vsplit --cwd=$dir lazygit

    # Split horizontally below lazygit for whatever else
    kitty @ launch --location=hsplit --cwd=$dir

    # Focus the claude window
    kitty @ focus-window --match 'title:claude'
end
