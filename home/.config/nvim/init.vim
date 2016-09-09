if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" au VimEnter * PlugInstall

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'herrbischoff/cobalt2.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Use ; for commands.
nnoremap ; :

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'bubblegum'

" NERDTree
let NERDTreeShowHidden=1
" au VimEnter * NERDTree
nnoremap <Leader><Bslash> :NERDTreeToggle<CR>

" Line numbers
set number
:nmap <C-N><C-N> :set invnumber<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker splits
nnoremap <Leader>l :vsp<CR>
nnoremap <Leader>j :sp<CR>

" Colors
syntax enable
set background=dark
colorscheme cobalt2
