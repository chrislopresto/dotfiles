set nocompatible

let mapleader = "\<Space>"

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim/

if dein#load_state(expand('~/.config/dein'))
call dein#begin(expand('~/.config/dein'))
  call dein#add('~/.config/dein/repos/github.com/Shougo/dein.vim/')

  call dein#add('dracula/vim')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('itchyny/lightline.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-commentary')
  call dein#add('terryma/vim-multiple-cursors')

  call dein#end()
  call dein#save_state()
endif

call s:SourceConfigFilesIn('rcfiles')

if dein#check_install()
  call dein#install()
endif
