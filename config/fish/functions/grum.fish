function grum --description "Fetch latest main and rebase current branch onto it"
    set -l current_branch (git branch --show-current)

    if test "$current_branch" = main
        echo "Already on main, nothing to rebase"
        return 1
    end

    echo "Fetching latest main..."
    git fetch origin main

    echo "Rebasing $current_branch onto origin/main..."
    git rebase origin/main
end
