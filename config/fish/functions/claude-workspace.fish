function claude-workspace --description "Open a kitty tab laid out for working with claude"
    # Usage: claude-workspace <dir> <title> <agent-cmd> [setup-cmd]
    # The agent pane runs <agent-cmd> (claude or opencode).
    #
    # ┌──────────────┬──────────────┐
    # │ nvim    25%  │ hunk    25%  │
    # ├──────────────┼──────────────┤
    # │              │              │
    # │ claude  75%  │ lazygit 50%  │
    # │              │              │
    # │              ├──────────────┤
    # │              │ prompt 12.5% │
    # │              ├──────────────┤
    # │              │ prompt 12.5% │
    # └──────────────┴──────────────┘
    set -l dir $argv[1]
    set -l title $argv[2]
    set -l claude_cmd $argv[3]
    set -l setup_cmd $argv[4]

    set -l prompt_cmd fish
    if test -n "$setup_cmd"
        set prompt_cmd fish -c "$setup_cmd; exec fish"
    end

    # With the splits layout, --bias is the share of the split window's space
    # that the new window takes.
    set -l nvim_id (kitty @ launch --type=tab --tab-title=$title --cwd=$dir fish -c 'nvim .; exec fish')
    set -l hunk_id (kitty @ launch --location=vsplit --bias=50 --next-to=id:$nvim_id --cwd=$dir fish -c 'hunk diff --watch; exec fish')
    set -l claude_id (kitty @ launch --location=hsplit --bias=75 --next-to=id:$nvim_id --cwd=$dir fish -c "$claude_cmd; exec fish")
    set -l lazygit_id (kitty @ launch --location=hsplit --bias=75 --next-to=id:$hunk_id --cwd=$dir fish -c lazygit)
    set -l prompt_id (kitty @ launch --location=hsplit --bias=33 --next-to=id:$lazygit_id --cwd=$dir $prompt_cmd)
    kitty @ launch --location=hsplit --bias=50 --next-to=id:$prompt_id --cwd=$dir fish >/dev/null
    kitty @ focus-window --match=id:$claude_id
end
