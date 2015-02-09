" Turn off vi compatability
set nocompatible

" Installed plugins
" -----------------------------------------------------------------------------

call plug#begin()

" Error linting
Plug 'scrooloose/syntastic'

" Snippets
Plug 'SirVer/ultisnips'

" Commenting
Plug 'tpope/vim-commentary'

" Easily quote/surround objects
Plug 'tpope/vim-surround'

" Vim/tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'ajh17/VimCompletesMe'

call plug#end()

" Plugin specific settings
" -----------------------------------------------------------------------------

" Use python3 for syntastic, and let it check header files
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_cpp_check_header = 1

" Use c-f (forward) to expand snippets and c-b (backward) to jump backward
let g:UltiSnipsExpandTrigger="<c-f>"   
let g:UltiSnipsJumpForwardTrigger="<c-f>"    
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

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

" Highlight, incrament, and smartcase search
set incsearch
set hlsearch
set ignorecase
set smartcase 

" Tab will insert two spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Markdown specific indentation
au FileType markdown set tabstop=4
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4

" Python specific indentation
au FileType python set tabstop=4
au FileType python set shiftwidth=4
au FileType python set softtabstop=4

" Keybinds
" -----------------------------------------------------------------------------

" Remap jk to exit insert mode
inoremap jk <esc>

" Remap ctrl-s to save
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>
vnoremap <c-s> <c-o>:w<cr>

" Set leader to space
map <space> <leader>

" Make '' jump go to last cursor position by default
nnoremap '' ``

" Leader keybinds
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>f /
nnoremap <leader>fr :%s/
nnoremap <leader>n :noh<cr>
nnoremap <leader>v <C-v>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>sp :split<cr>
nnoremap <leader>fs 1z=
nnoremap <leader>wc :w <bar> !wc %<cr>

" Functions
" -----------------------------------------------------------------------------

func! WordProcessorMode() 
  map j gj
  map k gk
  setlocal wrap
  setlocal linebreak
  setlocal nonumber
  setlocal tabstop=8
  setlocal shiftwidth=8
  setlocal softtabstop=8
  setlocal noexpandtab
  setlocal spell spelllang=en_us
endfunc!
command! WP call WordProcessorMode()

" Status line
" -----------------------------------------------------------------------------

" Turn on status line
set laststatus=2

" Status line format
set statusline=\ →\ %F%=[%l/%L]\ 

" Status line colors
hi StatusLine cterm=none ctermbg=235 ctermfg=015
