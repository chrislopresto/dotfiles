alias nom='rm -rf node_modules && mkdir node_modules && touch node_modules/.metadata_never_index && yarn install'

alias gsuir="git submodule update --init --recursive"

alias emdbug="node debug ./node_modules/ember-cli/bin/ember build"
alias emdbugp="node debug ./node_modules/ember-cli/bin/ember build --environment=production"

alias ems='ember s'
alias emt='ember t --port 7357'
alias emsdbug='DEBUG=express:* ember s'

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
    PORT=7777
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
  ember test -s -tp $PORT
}
