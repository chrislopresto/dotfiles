function demain
    if test (count $argv) -eq 0
        echo "Specify a feature branch name"
        return 1
    end
    git stash save -u "demain"
    git branch $argv[1]
    git reset --hard origin/main
    git checkout $argv[1]
end
