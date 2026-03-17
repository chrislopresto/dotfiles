function cwd --description "Delete a git worktree and remove its local branch"
    argparse force -- $argv
    or return 1

    if test (count $argv) -lt 1
        echo "Usage: cwd [--force] <feature-name>"
        return 1
    end

    set -l name $argv[1]
    set -l branch clop/$name

    # Ensure we're in a git repo
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: not a git repository"
        return 1
    end

    # Derive repo name from the root of the git repo
    set -l repo_name (basename (git rev-parse --show-toplevel))
    set -l worktree_dir $CLOP_WORKTREES_DIR/$repo_name/$name

    # Check that the worktree exists
    if not test -d $worktree_dir
        echo "Error: worktree not found at $worktree_dir"
        return 1
    end

    # Check that the branch exists
    if not git show-ref --verify --quiet refs/heads/$branch
        echo "Error: branch $branch does not exist"
        return 1
    end

    # Confirm before proceeding
    echo "This will:"
    echo "  - Remove worktree at $worktree_dir"
    echo "  - Delete local branch $branch"
    read -l -P "Proceed? [y/N] " confirm
    if test "$confirm" != y -a "$confirm" != Y
        echo "Aborted."
        return 1
    end

    # Remove the worktree
    if set -q _flag_force
        git worktree remove --force $worktree_dir
    else
        git worktree remove $worktree_dir
    end
    or begin
        echo "Error: failed to remove worktree (it may have uncommitted changes, use --force)"
        return 1
    end

    # Delete the local branch
    if set -q _flag_force
        git branch -D $branch
    else
        git branch -d $branch
    end
    or begin
        echo "Warning: branch $branch could not be deleted (it may not be fully merged)"
        echo "Use 'cwd --force $name' to force delete"
        return 1
    end

    echo "Done. Removed worktree and branch for $name."
end
