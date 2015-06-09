alias glt="git log --since=midnight --author='Chris LoPresto' --oneline"
alias gltc="glt | awk '\$1=\"\" ; sub(/^ /, \"\")'"
alias gltcs="gltc | awk '{printf \"%s. \",\$0}'"
alias gdlm="git branch --merged | grep -v '^* master$' | grep -v '^  master$' | xargs git branch -d"
alias gundo="git reset --soft HEAD~1"

function demaster {
  if [[ $# -eq 0 ]] ; then
    echo "Specify a feature branch name"
  else
    git branch $1
    git reset --hard origin/master
    git checkout $1
  fi
}
