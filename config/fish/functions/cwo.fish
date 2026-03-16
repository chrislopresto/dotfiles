function cwo --description "Create a git worktree in ~/src-worktrees and open a kitty tab for a feature"
    argparse pnpm -- $argv
    or return 1

    if test (count $argv) -lt 1
        echo "Usage: cwo [--pnpm] <feature-name>"
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

    # Derive repo name from the root of the git repo
    set -l repo_name (basename (git rev-parse --show-toplevel))
    set -l worktree_dir $HOME/worktrees/$repo_name/$name

    # Ensure parent directory exists
    mkdir -p (dirname $worktree_dir)

    # Create worktree, reusing branch and worktree if they already exist
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

    # Create new tab with nvim (capture window id for targeting splits)
    set -l nvim_id (kitty @ launch --type=tab --tab-title=$name --cwd=$dir fish -c 'nvim .')

    # Split horizontally below nvim for claude (on left)
    set -l claude_id (kitty @ launch --location=hsplit --match=id:$nvim_id --cwd=$dir fish -c claude)

    # Split vertically next to claude for lazygit
    kitty @ launch --location=vsplit --cwd=$dir fish -c lazygit

    # Split horizontally below lazygit for setup tasks
    set -l setup_cmd 'mise trust'
    if set -q _flag_pnpm
        set setup_cmd "$setup_cmd; and pnpm install"
    end
    kitty @ launch --location=hsplit --cwd=$dir fish -c "$setup_cmd; exec fish"

    # Focus the claude window
    kitty @ focus-window --match=id:$claude_id
end
