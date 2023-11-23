brewery=$(brew --prefix)

# Configure zsh completions for brew-managed formulae
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# config
alias reload!='. ~/.zshrc'
alias reloadt!='tmux source-file ~/.tmux.conf'

# zmv - Move or rename multiple files with wildcards and such
# Thanks go to http://www.mfasold.net/blog/2008/11/moving-or-renaming-multiple-files/
autoload -U zmv
alias mmv='noglob zmv -W'

# misc
alias localip="ifconfig -a | grep -o 'inet \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | grep -v '127\.0\.0\.1' | sed -e 's/inet //'"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed"

function check_compression {
  curl -I -H 'Accept-Encoding: gzip,deflate' $1 | grep "Content-Encoding"
}

function watchman_reset {
  (for root in $(watchman watch-list | jq '.roots | .[]'); do watchman watch-del $(echo $root | sed 's/"//g') ; done)
}

function app_on_port {
  lsof -n -i4TCP:$1 | grep LISTEN
}

function vs {
  if [ -f "$HOME/.vscode/workspaces/$1.code-workspace" ]; then
    code "$HOME/.vscode/workspaces/$1.code-workspace"
  elif [ -f "$HOME/.vscode/workspaces/private/$1.code-workspace" ]; then
    code "$HOME/.vscode/workspaces/private/$1.code-workspace"
  else
    code $1
  fi
}

# fasd
eval "$(fasd --init auto)"

# autojump
[[ -s $brewery/etc/autojump.sh ]] && source $brewery/etc/autojump.sh

# homebrew
if ! type brew > /dev/null; then
  if [ -d /opt/homebrew ]; then
    # echo 'brew found in /opt/homebrew. Assuming Apple Silicon.'
    # echo 'Adding brew to path'
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.profile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo 'brew not found on path. /opt/homebrew directory not found on disk.'
  fi
fi

# node
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# rails
alias rake='noglob bundle exec rake'
alias beg='bundle exec guard start'
alias be='bundle exec'

function dbrr() {
  rake db:migrate:down VERSION=$1
  rake db:migrate:up VERSION=$1
}

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# tmux
export DISABLE_AUTO_TITLE=true
alias tms='tmuxinator start'

# aws
function aws-set {
  export AWS=$1
  export AWS_DEFAULT_PROFILE=$AWS
  export AWS_PROFILE=$AWS

  export AWS_REGION=$(grep --after-context=2 "\[profile ${AWS}\]" ~/.aws/config |
                      grep 'region'                                             |
                      sed -e 's#.*=\(\)#\1#'                                    |
                      xargs)

  if [[ "${2:-true}" = "true" ]]; then
    echo "AWS_PROFILE         : ${AWS_PROFILE}"
    echo "AWS_DEFAULT_PROFILE : ${AWS_DEFAULT_PROFILE}"
    echo "AWS_REGION          : ${AWS_REGION}"
    echo
  fi
}

# fzf
[[ $- == *i* ]] && source "$brewery/opt/fzf/shell/completion.zsh" 2> /dev/null
source "$brewery/opt/fzf/shell/key-bindings.zsh"

# clo
alias clo="$HOME/p/clo/bin/run"

# Navigate to chrome://inspect
alias ebdebug="JOBS=1 node --inspect-brk ./node_modules/.bin/ember build"

# Interactive preview with fzf and bat
# https://pragmaticpineapple.com/four-useful-fzf-tricks-for-your-terminal/
# https://github.com/sharkdp/bat
alias p="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
