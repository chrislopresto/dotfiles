export NODE_ENV=dev

export NVM_DIR="/Users/chrislopresto/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 0.12

alias lnm='ls -lh node_modules | grep "\->"'
