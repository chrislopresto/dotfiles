alias nom='npm cache clean && rm -rf node_modules && mkdir node_modules && touch node_modules/.metadata_never_index && npm install'
alias bom='bower cache clean && rm -rf bower_components && mkdir bower_components && touch bower_components/.metadata_never_index && bower install'
alias nombom="rm -rf dist tmp && nom && bom"

alias gsuir="git submodule update --init --recursive"

alias emdbug="node debug ./node_modules/ember-cli/bin/ember build"
alias emdbugp="node debug ./node_modules/ember-cli/bin/ember build --environment=production"

alias ems='ember s'
alias emt='ember t --port 7357'
alias emsdbug='DEBUG=express:* ember s'

alias ecb='ember cordova:build --platform=ios'
alias ecba='ember cordova:build --platform=android'
alias nbi='npm install && bower install'

ulimit -n 10000

function emss {
  if [[ $# -eq 0 ]] ; then
    # No port specified
    PORT=4200
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
  ember s --port $PORT
}

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
  ember t -s --test-port $PORT
}
