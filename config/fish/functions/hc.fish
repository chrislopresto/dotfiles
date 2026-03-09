function hc
    set -l base_branch (if set -q argv[1]; echo $argv[1]; else; echo main; end)
    set -l current_branch (git branch --show-current)
    set -l compare_segment "$base_branch...$current_branch"
    set -l compare_base_url (git remote get-url origin | string replace -r '\.git$' '')
    set -l compare_url "$compare_base_url/compare/$compare_segment"
    echo "Opening $compare_url"
    open $compare_url
end
