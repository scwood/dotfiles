" Turn off VI compatability
set nocompatible

" Pathogen init
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" File based indenting
filetype plugin indent on

" Turn off backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Turn on syntax highlighting
syntax on

" Colorscheme
set background=dark
colorscheme jellybeans

" Turn on line numbers
set number

" Use system clipboard
set clipboard=unnamed

" Set 80 character ruler
set colorcolumn=80

" Highlight current line
set cursorline

" Highlight and incramental search
set incsearch
set hlsearch

"Tab will insert four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Make backspace behave like normal
set backspace=indent,eol,start

" Stop using arrows in insert mode
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" ` saves in command mode
map ` :w! <CR>

" Map jk to escape
inoremap jk <ESC>

" Jump up a line after completing brace
inoremap { {<ESC>o}<ESC><S-o>

" Lightline settings
set laststatus=2
set noshowmode
let g:lightline = {
\ 'separator': { 'left': '⮀', 'right': '⮂' },
\ 'subseparator': { 'left': '⮁', 'right': '⮃' },
\ 'colorscheme': 'jellybeans',
\ 'active': {
\     'left': [ [ 'mode', 'paste' ], [ 'bufferline' ] ],
\     'right': [],
\ },
\ 'component': {
\     'bufferline': 
\     '%{bufferline#refresh_status()}%{g:bufferline_status_info.before 
\     . g:bufferline_status_info.current . g:bufferline_status_info.after}'
\ }
\ }

" Nerd tree toggle
map <C-n> :NERDTreeToggle<CR>

" Turn bufferline off in the command line
let g:bufferline_echo = 0

" Scrolling
set sidescroll=1
