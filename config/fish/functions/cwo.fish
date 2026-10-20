function cwo --description "Create a git worktree (via worktrunk) and open a workspace for a feature"
    # Ensure we're in kitty
    if not test "$TERM" = xterm-kitty; and not test -n "$KITTY_PID"
        echo "cwo requires kitty"
        return 1
    end

    # Ensure worktrunk is installed
    if not command --query wt
        echo "cwo requires worktrunk (wt); install it with: brew install worktrunk"
        return 1
    end

    argparse pnpm bg 'harness=' -- $argv
    or return 1

    if test (count $argv) -lt 1
        echo "Usage: cwo [--pnpm] [--harness claude|opencode] [--bg] <feature-name>"
        return 1
    end

    # Resolve the agent command up front so a bad flag fails before we create
    # a worktree.
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

    # Let worktrunk create (or reuse) the worktree at its default location and
    # report the path back as JSON so we can open the workspace there. Only pass
    # --create for a new branch; an existing branch just gets a worktree.
    set -l result
    if git show-ref --verify --quiet refs/heads/$branch
        set result (command wt switch --no-cd -y --format json $branch)
        or return 1
    else
        set result (command wt switch --no-cd -y --create --base ^ --format json $branch)
        or return 1
    end

    set -l dir (echo $result | jq -r '.path // empty')
    if test -z "$dir"
        echo "Error: worktrunk did not return a worktree path"
        return 1
    end

    if test (echo $result | jq -r '.action // empty') = existing
        echo "Reusing existing worktree at $dir"
    else
        echo "Created worktree at $dir"
    end

    # Build setup command
    set -l setup_cmd 'mise trust'
    if set -q _flag_pnpm
        set setup_cmd "$setup_cmd; and pnpm install"
    end

    claude-workspace $dir $name $agent_cmd $setup_cmd
end
