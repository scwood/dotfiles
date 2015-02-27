" Turn off vi compatibility
set nocompatible

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

call plug#begin()

Plug 'SirVer/ultisnips' " snippets
Plug 'christoomey/vim-tmux-navigator' " tmux/vim split navigation
Plug 'ervandew/supertab' " autocompletion
Plug 'junegunn/goyo.vim' " distraction free writing
Plug 'junegunn/vim-peekaboo' " register viewer
Plug 'scrooloose/syntastic' " syntax highlighting
Plug 'sjl/vitality.vim' " iterm2 cursor change
Plug 'tpope/vim-commentary' " comment out blocks
Plug 'tpope/vim-repeat' " make plugin commands repeatable
Plug 'tpope/vim-surround' " surround objects

call plug#end()

" -----------------------------------------------------------------------------
" Plugin specific settings
" -----------------------------------------------------------------------------

" Use python3 for syntastic, and let it check header files for c languages
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_cpp_check_header = 1

" Use c-f (forward) to expand snippets and c-b (backward) to jump backward
let g:UltiSnipsExpandTrigger="<c-f>"   
let g:UltiSnipsJumpForwardTrigger="<c-f>"    
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Reverse default supertab completion direction
let g:SuperTabDefaultCompletionType = "<c-n>"

" Automatically populate the error location list
let g:syntastic_always_populate_loc_list = 1

" Set Goyo width
let g:goyo_width = 79

" -----------------------------------------------------------------------------
" General settings
" -----------------------------------------------------------------------------

" Make backspace behave normally
set backspace=indent,eol,start

" Turn on line numbers 
set number

" Highlight current line
set cursorline

" Use system clipboard
set clipboard=unnamed

" Set 80 character vertical ruler
set colorcolumn=80

" Set a three line scrolling buffer near the top and bottom of the screen
set scrolloff=3

" Turn on syntax highlighting
syntax on

" Completion menu behavior
set completeopt=menu,longest

" Colorscheme
set background=dark
colorscheme jellybeans

" Turn on autoindent/smartindent
set autoindent
set smartindent

" Turn off backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Highlight, increment, and smartcase search
set hlsearch
set ignorecase
set incsearch
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

" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------

" Remap jk to exit insert mode
inoremap jk <esc>

" Save mappings
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>
vnoremap <c-s> <c-o>:w<cr>

" Set leader to space
map <space> <leader>

" Make '' jump go to last cursor position by default
nnoremap '' ``

" Leader keybinds
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>sar :%s/
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>z 1z=
nnoremap <leader>wc :w <bar> !wc %<cr>
nnoremap <leader>p :ls<cr>:b<space>

" -----------------------------------------------------------------------------
" Functions
" -----------------------------------------------------------------------------

func! WordProcessorMode() 
  map j gj
  map k gk
  setlocal colorcolumn=0
  setlocal linebreak
  setlocal noexpandtab
  setlocal nonumber
  setlocal shiftwidth=8
  setlocal softtabstop=8
  setlocal tabstop=8
  setlocal wrap
endfunc!
command! WP call WordProcessorMode()

func! s:goyo_enter()
  silent !tmux set status off
  call WordProcessorMode()
endfunc!

func! s:goyo_leave()
  silent !tmux set status on
  :soure $MYVIMRC
  hi StatusLine cterm=none ctermbg=235 ctermfg=015
endfunc!

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Turn on status line
set laststatus=2

" Status line format
set statusline=\ →\ %F%=[%l/%L]\ 

" Status line colors
hi StatusLine cterm=none ctermbg=235 ctermfg=015
