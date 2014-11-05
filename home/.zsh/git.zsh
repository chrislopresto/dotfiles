alias glt="git log --since=midnight --author='Chris LoPresto' --oneline"
alias gltc="glt | awk '\$1=\"\" ; sub(/^ /, \"\")'"
alias gltcs="gltc | awk '{printf \"%s. \",\$0}'"
