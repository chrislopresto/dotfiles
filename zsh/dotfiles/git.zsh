export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

function demain {
  if [[ $# -eq 0 ]] ; then
    echo "Specify a feature branch name"
  else
    git stash save -u "demain"
    git branch $1
    git reset --hard origin/main
    git checkout $1
  fi
}

function demaster {
  if [[ $# -eq 0 ]] ; then
    echo "Specify a feature branch name"
  else
    git stash save -u "demaster"
    git branch $1
    git reset --hard origin/master
    git checkout $1
  fi
}

function delete-branches() {
  if [[ $# -eq 0 ]] ; then
    echo "Specify a branch pattern so as not to delete everything"
  else
    git branch -D `git branch | grep -E "$1"`
  fi
}

function git-current-branch() {
  git rev-parse --abbrev-ref HEAD
}

alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'

alias gc='git commit -v'
alias gfc="git commit -v --fixup"
alias gc!='git commit -v --amend'

alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'

alias gcm='git checkout main'
alias gco='git checkout'
alias gcof='git checkout $(git branch  | fzf)'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

alias ggpull='git pull origin $(git-current-branch)'
alias ggpush='git push origin $(git-current-branch)'

alias ggsup='git branch --set-upstream-to=origin/$(git-current-branch)'
alias gpsup='git push --set-upstream origin $(git-current-branch)'

alias ghh='git help'

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

alias glg='git log --stat'
alias glo='git log --oneline --decorate'

alias gm='git merge'
alias gmom='git merge origin/master'
alias gmum='git merge upstream/master'

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
alias gpu='git push upstream'
alias gpv='git push -v'

alias gr='git remote'
alias grv='git remote -v'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grim="git rebase --interactive --autosquash main"
alias gri="git rebase --interactive --autosquash $1"

alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'

alias gsb='git status -sb'
alias gss='git status -s'
alias gst='git status'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

alias gl='git pull'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream master'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias git=hub
alias hcm='hub compare main...$(git-current-branch)'

function hc() {
  COMPARE="$1"..."$(git-current-branch)"
  hub compare $COMPARE
}

alias gdlm="git branch --merged | grep -v '^* main$' | grep -v '^  main$' | xargs git branch -d"
alias gcmm="git checkout main ; git pull --prune ; gdlm"

alias glt="git log --since=midnight --author='Chris LoPresto' --oneline"
alias gltc="glt | awk '\$1=\"\" ; sub(/^ /, \"\")'"
alias gltcs="gltc | awk '{printf \"%s. \",\$0}'"

alias gundo="git reset --soft HEAD~1"

# Android development
alias talkbackon="adb shell settings put secure enabled_accessibility_services com.google.android.marvin.talkback/com.google.android.marvin.talkback.TalkBackService"
alias talkbackoff="adb shell settings put secure enabled_accessibility_services com.android.talkback/com.google.android.marvin.talkback.TalkBackService"
alias android_debug="adb shell input keyevent 82"
