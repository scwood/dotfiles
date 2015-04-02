set nocompatible

" ------------------------------------------------------------------------------
" Plugins
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
" Plugin specific settings
" ------------------------------------------------------------------------------

" IndentLine
let g:indentLine_char = '⋮'

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Syntasitc 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-f>"   
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"    

" ------------------------------------------------------------------------------
" General settings
" ------------------------------------------------------------------------------

" Make backspace behave normally
set backspace=indent,eol,start

" Turn on line numbers 
set number

" Use system clipboard
set clipboard=unnamed

" Set a three line scrolling buffer near the top and bottom of the screen
set scrolloff=3

" Completion menu behavior
set completeopt=menu,longest

" Error matching for lines over 80 characters
match ErrorMsg '\%>80v.\+'

" Turn on syntax highlighting
syntax on

" Turn off errors notifications
set visualbell 
set t_vb=

" Statusline
set laststatus=2
set statusline=\ →\ %F%=[%l/%L]\ 

" Colorscheme
set background=dark
colorscheme hybrid

" Turn on autoindent/smartindent
set autoindent
set smartindent

" Turn off backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Highlight, increment, and smartcase search
set hlsearch
set incsearch
set ignorecase
set smartcase 

" Tab will insert two spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Markdown specific indentation
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4

" Python specific indentation
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

" Save mappings
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>
vnoremap <c-s> <c-o>:w<cr>

" Set leader to space
map <space> <leader>

" Leader keybinds
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>sar :%s/
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>z 1z=e
nnoremap <leader>wc :w <bar> !wc %<cr>
nnoremap <leader>p :FZF<cr>

" ------------------------------------------------------------------------------
" Functions/Autocommands
" ------------------------------------------------------------------------------

" Word processing
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

" Goyo 
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

" Error matching for lines over 80 characters
autocmd WinEnter * match ErrorMsg '\%>80v.\+'
