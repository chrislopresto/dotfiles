# truly misc
alias reload!='. ~/.zshrc'
alias reloadt!='tmux source-file ~/.tmux.conf'

# Move or rename multiple files with wildcards and such
# Thanks go to http://www.mfasold.net/blog/2008/11/moving-or-renaming-multiple-files/
autoload -U zmv
alias mmv='noglob zmv -W'

alias localip="ifconfig -a | grep -o 'inet \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | grep -v '127\.0\.0\.1' | sed -e 's/inet //'"

alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed"

alias st="subl"

alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias cpi="${aliases[cp]:-cp} -i"
alias lni="${aliases[ln]:-ln} -i"
alias mvi="${aliases[mv]:-mv} -i"
alias rmi="${aliases[rm]:-rm} -i"

function check_compression {
  curl -I -H 'Accept-Encoding: gzip,deflate' $1 | grep "Content-Encoding"
}

function watchman_reset {
  (for root in $(watchman watch-list | jq '.roots | .[]'); do watchman watch-del $(echo $root | sed 's/"//g') ; done)
}

function app_on_port {
  lsof -n -i4TCP:$1 | grep LISTEN
}

# fasd
eval "$(fasd --init auto)"

# node
eval "$(nodenv init -)"

alias lnm='ls -lh node_modules | grep "\->"'

# rails
alias rake='noglob bundle exec rake'
alias beg='bundle exec guard start'
alias be='bundle exec'

function dbrr() {
  rake db:migrate:down VERSION=$1
  rake db:migrate:up VERSION=$1
}

# rbenv
if [ -n "$TMUX" ]; then
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi

# tmux
export DISABLE_AUTO_TITLE=true
alias tms='tmuxinator start'
