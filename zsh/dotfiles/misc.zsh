brewery=$(brew --prefix)

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

# zsh
alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias cpi="${aliases[cp]:-cp} -i"
alias lni="${aliases[ln]:-ln} -i"
alias mvi="${aliases[mv]:-mv} -i"
alias rmi="${aliases[rm]:-rm} -i"

# fasd
eval "$(fasd --init auto)"

# autojump
[[ -s $brewery/etc/autojump.sh ]] && source $brewery/etc/autojump.sh

# node
eval "$(nodenv init -)"

# rails
alias rake='noglob bundle exec rake'
alias beg='bundle exec guard start'
alias be='bundle exec'

function dbrr() {
  rake db:migrate:down VERSION=$1
  rake db:migrate:up VERSION=$1
}

# rbenv
eval "$(rbenv init -)"

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
