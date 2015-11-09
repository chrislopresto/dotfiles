export RBENV_ROOT=/opt/boxen/rbenv
export PATH=$RBENV_ROOT/bin:$RBENV_ROOT/plugins/ruby-build/bin:$PATH

if [ -n "$TMUX" ]; then
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi
