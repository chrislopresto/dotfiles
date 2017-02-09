alias reload!='. ~/.zshrc'
alias reloadt!='tmux source-file ~/.tmux.conf'

# Move or rename multiple files with wildcards and such
# Thanks go to http://www.mfasold.net/blog/2008/11/moving-or-renaming-multiple-files/
autoload -U zmv
alias mmv='noglob zmv -W'

# List only directories
alias lsd='ls -l | grep "^d"'
# List only files
alias lsf='ls -l | grep -v "^d"'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig -a | grep -o 'inet \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | grep -v '127\.0\.0\.1' | sed -e 's/inet //'"

alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed"

alias st="subl"

function marked() {
  open $1 -a Marked\ 2
}
