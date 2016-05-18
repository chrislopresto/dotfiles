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

function df {
  cd ~/.homesick/repos/dotfiles && stp
}

function stp {
  if test -z "$(find . -maxdepth 1 -name '*.sublime-project' -print -quit)"; then
    DIRECTORY_NAME=${PWD##*/}
    cp ~/.homesick/repos/dotfiles/sublime/example.sublime-project "$DIRECTORY_NAME.sublime-project"
  fi
  st *.sublime-project
}

function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 150 -L ${1:-3} -aC $2
}
