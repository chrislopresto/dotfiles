function delete-branches
    if test (count $argv) -eq 0
        echo "Specify a branch pattern so as not to delete everything"
        return 1
    end
    git branch -D (git branch | grep -E $argv[1])
end
