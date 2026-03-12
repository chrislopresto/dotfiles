function t --description "brew-installed tilt, not the tilt ruby gem" --wraps=tilt
    set -l cmd (brew --prefix)/bin/tilt
    $cmd $argv
end
