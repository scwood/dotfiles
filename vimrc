" turn off vi compatibility 
set nocompatible

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin()

Plug 'SirVer/ultisnips' " snippets
Plug 'Yggdroot/indentLine' " indent guides
Plug 'christoomey/vim-tmux-navigator' " tmux/vim split navigation
Plug 'ervandew/supertab' " autocompletion
Plug 'junegunn/fzf', { 'dir': '~/.fzf' } " fuzzy finder
Plug 'junegunn/goyo.vim' " distraction free writer (for word processing)
Plug 'junegunn/vim-peekaboo' " register viewer
Plug 'scrooloose/syntastic' " syntax highlighting
Plug 'scwood/vim-hybrid' " colorscheme
Plug 'tpope/vim-commentary' " comment out blocks
Plug 'tpope/vim-surround' " surround objects

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

" indentLine
let g:indentLine_char = '⋮'

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" syntasitc 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

" ultisnips
let g:UltiSnipsExpandTrigger="<c-f>"   
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"    

" ------------------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------------------

" make backspace behave normally
set backspace=indent,eol,start

" turn on line numbers 
set number

" use system clipboard
set clipboard=unnamed

" set a three line scrolling buffer near the top and bottom of the screen
set scrolloff=3

" completion menu behavior
set completeopt=menu,longest

" error matching for lines over 80 characters
match ErrorMsg '\%>80v.\+'

" turn on syntax highlighting
syntax on

" turn off error notifications
set visualbell 
set t_vb=

" statusline
set laststatus=2
set statusline=\ →\ %F%=[%l/%L]\ 

" colorscheme
set background=dark
colorscheme hybrid

" turn on autoindent/smartindent
set autoindent
set smartindent

" turn off backup/swap files
set nobackup
set nowritebackup
set noswapfile

" highlight, increment, and smartcase search
set hlsearch
set incsearch
set ignorecase
set smartcase 

" tab will insert two spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" markdown specific indentation
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4

" python specific indentation
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

" ------------------------------------------------------------------------------
" mappings
" ------------------------------------------------------------------------------

" save mappings
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>
vnoremap <c-s> <c-o>:w<cr>

" set leader to space
map <space> <leader>

" leader keybinds
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>sar :%s/
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>z 1z=e
nnoremap <leader>wc :w <bar> !wc %<cr>
nnoremap <leader>p :FZF<cr>

" ------------------------------------------------------------------------------
" functions/autocommands
" ------------------------------------------------------------------------------

" word processing
func! WordProcessorMode() 
  map j gj
  map k gk
  setlocal colorcolumn=0
  setlocal linebreak
  setlocal noexpandtab
  setlocal nonumber
  setlocal shiftwidth=4
  setlocal softtabstop=4
  setlocal tabstop=4
  setlocal wrap
  setlocal spell
  hi ErrorMsg NONE
  syntax off " makes long lines not so laggy
endfunc!
command! WP call WordProcessorMode()

" goyo 
func! s:goyo_enter()
  silent !tmux set status off
endfunc!
func! s:goyo_leave()
  silent !tmux set status on
  :source $MYVIMRC
endfunc!
autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

" error matching for lines over 80 characters
autocmd WinEnter * match ErrorMsg '\%>80v.\+'
