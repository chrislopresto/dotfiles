alias glt="git log --since=midnight --author='Chris LoPresto' --oneline"
alias gltc="glt | awk '\$1=\"\" ; sub(/^ /, \"\")'"
alias gltcs="gltc | awk '{printf \"%s. \",\$0}'"
alias gdlm="git branch --merged | grep -v '^* master$' | grep -v '^  master$' | xargs git branch -d"
