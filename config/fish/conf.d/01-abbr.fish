# neovim
if command --query nvim
    abbr --add vim nvim
    abbr --add nv nvim
    abbr --add v nvim
    abbr --add nn 'nvim .'
end

# Git
abbr --add lg lazygit
abbr --add ga 'git add'
abbr --add gb 'git branch'
abbr --add gc 'git commit'
abbr --add gco 'git checkout'
abbr --add gd 'git diff'
abbr --add gp 'git push'
abbr --add gpf 'git push --force-with-lease'
abbr --add grba 'git rebase --abort'
abbr --add grbc 'git rebase --continue'
abbr --add gri 'git rebase --interactive --autosquash'
abbr --add grim 'git rebase --interactive --autosquash main'
abbr --add grh 'git reset HEAD'
abbr --add grhh 'git reset HEAD --hard'
abbr --add gsb 'git status -sb'
abbr --add gup 'git pull --rebase'
abbr --add gpsup 'git push --set-upstream origin (git branch --show-current)'
abbr --add gwl 'git worktree list'
abbr --add gwr 'git worktree remove'

# Misc
abbr --add pn pnpm
abbr --add c claude
abbr --add buc 'brew upgrade claude-code'
