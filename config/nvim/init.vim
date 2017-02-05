if &compatible
  set nocompatible
endif

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
  call s:SourceConfigFilesIn('rcplugins')
  call dein#end()
  call dein#save_state()
endif

call s:SourceConfigFilesIn('rcfiles')

if dein#check_install()
  call dein#install()
endif
