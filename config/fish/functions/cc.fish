function cc --description "Open a workspace with nvim, claude, lazygit, and whatever else"
    # Ensure we're in kitty
    if not test "$TERM" = xterm-kitty; and not test -n "$KITTY_PID"
        echo "cc requires kitty"
        return 1
    end

    argparse bg -- $argv
    or return 1

    set -l dir (realpath (test -n "$argv[1]" && echo $argv[1] || echo .))
    set -l title (test -n "$argv[2]" && echo $argv[2] || basename $dir)

    set -l claude_cmd claude
    if set -q _flag_bg
        set claude_cmd "claude --bg"
    end

    set -l nvim_id (kitty @ launch --type=tab --tab-title=$title --cwd=$dir fish -c 'nvim .; exec fish')
    set -l claude_id (kitty @ launch --location=hsplit --match=id:$nvim_id --cwd=$dir fish -c "$claude_cmd; exec fish")
    kitty @ launch --location=vsplit --cwd=$dir fish -c lazygit
    kitty @ launch --location=hsplit --cwd=$dir
    kitty @ focus-window --match=id:$claude_id
end
