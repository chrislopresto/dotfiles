function check_compression {
  curl -I -H 'Accept-Encoding: gzip,deflate' $1 | grep "Content-Encoding"
}

function watchman_reset {
  (for root in $(watchman watch-list | jq '.roots | .[]'); do watchman watch-del $(echo $root | sed 's/"//g') ; done)
}

function app_on_port {
  lsof -n -i4TCP:$1 | grep LISTEN
}

function code {
  if [[ $# = 0 ]]
  then
      open -a "Visual Studio Code"
  else
      [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
      open -a "Visual Studio Code" --args "$F"
  fi
}

function gitup {
  if [[ $# = 0 ]]
  then
      open -a "GitUp"
  else
      [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
      open -a "GitUp" --args "$F"
  fi
}
