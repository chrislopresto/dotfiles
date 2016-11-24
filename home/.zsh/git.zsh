alias glt="git log --since=midnight --author='Chris LoPresto' --oneline"
alias gltc="glt | awk '\$1=\"\" ; sub(/^ /, \"\")'"
alias gltcs="gltc | awk '{printf \"%s. \",\$0}'"
alias gdlm="git branch --merged | grep -v '^* master$' | grep -v '^  master$' | xargs git branch -d"
alias gdlms="git branch --merged | grep -v '^* stage$' | grep -v '^  stage$' | xargs git branch -d"
alias gundo="git reset --soft HEAD~1"
alias gris="git rebase --interactive --autosquash stage"
alias grim="git rebase --interactive --autosquash master"
alias gfc="gc --fixup"
alias gcos="gco stage"
alias gcmm="gcm ; gl --prune ; gdlm"
alias gcss="gcos ; gl --prune ; gdlms"

# alias backmerge='git co master && git pull --ff-only && git co stage && git pull --ff-only && git merge master --no-edit && git push && git co develop && git pull --ff-only && git merge stage --no-edit && git push'
alias backmerge='gco master && git pull --ff-only && gco stage && git pull --ff-only && git merge master --no-edit && git push'

function demaster {
  if [[ $# -eq 0 ]] ; then
    echo "Specify a feature branch name"
  else
    git branch $1
    git reset --hard origin/master
    git checkout $1
  fi
}

function destage {
  if [[ $# -eq 0 ]] ; then
    echo "Specify a feature branch name"
  else
    git branch $1
    git reset --hard origin/stage
    git checkout $1
  fi
}
