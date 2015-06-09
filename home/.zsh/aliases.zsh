alias reload!='. ~/.zshrc && tmux source-file ~/.tmux.conf'

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

# Flush DNS
alias flushdns="sudo killall -HUP mDNSResponder"

# Open local Sublime project
alias stp="st *.sublime-project"
