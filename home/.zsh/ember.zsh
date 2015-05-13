alias nom="rm -rf node_modules && npm cache clear && npm i"
alias gsuir="git submodule update --init --recursive"

alias nombom="rm -rf node_modules bower_components dist tmp && npm cache clean && bower cache clean && npm install && bower install"
alias emdbug="node debug ./node_modules/ember-cli/bin/ember build"
alias emdbugp="node debug ./node_modules/ember-cli/bin/ember build --environment=production"

alias ems='ember s'
alias emt='ember t --port 7357'
alias emsdbug='DEBUG=express:* ember s'

function emts {
  if [[ $# -eq 0 ]] ; then
    # No port specified
    PORT=7357
  else
    PORT=$1
  fi
  if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null ; then
    # Port in use
    i="0"
    while [ $i -lt 20 ]
    do
      PORT=$[$PORT+1]
      if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null ; then
        # Port still in use
      else
        i="20" # Break out of loop
      fi
      i=$[$i+1]
    done
  fi
  ember t -s --port $PORT
}
