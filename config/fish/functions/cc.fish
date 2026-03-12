function cc --description "Open a kitty tab with nvim, claude, lazygit, and whatever else"
    set -l dir (realpath (test -n "$argv[1]" && echo $argv[1] || echo .))
    set -l title (test -n "$argv[2]" && echo $argv[2] || basename $dir)

    # Create new tab with nvim (capture window id for targeting splits)
    set -l nvim_id (kitty @ launch --type=tab --tab-title=$title --cwd=$dir fish -c 'nvim .')

    # Split horizontally below nvim for claude (on left)
    set -l claude_id (kitty @ launch --location=hsplit --match=id:$nvim_id --cwd=$dir fish -c claude)

    # Split vertically next to claude for lazygit
    kitty @ launch --location=vsplit --cwd=$dir fish -c lazygit

    # Split horizontally below lazygit for whatever else
    kitty @ launch --location=hsplit --cwd=$dir

    # Focus the claude window
    kitty @ focus-window --match=id:$claude_id
end
