function cc --description "Open a workspace with nvim, an agent (claude or opencode), lazygit, and whatever else"
    # Ensure we're in kitty
    if not test "$TERM" = xterm-kitty; and not test -n "$KITTY_PID"
        echo "cc requires kitty"
        return 1
    end

    argparse bg 'harness=' -- $argv
    or return 1

    set -l harness (set -q _flag_harness && echo $_flag_harness || echo opencode)
    set -l agent_cmd
    switch $harness
        case opencode
            if set -q _flag_bg
                echo "--bg is only supported with --harness claude"
                return 1
            end
            set agent_cmd opencode
        case claude
            set agent_cmd claude
            if set -q _flag_bg
                set agent_cmd "claude --bg"
            end
        case '*'
            echo "Unknown harness: $harness (expected claude or opencode)"
            return 1
    end

    set -l dir (realpath (test -n "$argv[1]" && echo $argv[1] || echo .))
    set -l title (test -n "$argv[2]" && echo $argv[2] || basename $dir)

    claude-workspace $dir $title $agent_cmd
end
