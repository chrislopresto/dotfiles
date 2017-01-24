export PATH="$HOME/.ellipsis/bin:$PATH"

fpath=($HOME/.ellipsis/comp $fpath)
autoload -U compinit; compinit
