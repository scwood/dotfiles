" Turn off vi compatability
set nocompatible

" Installed plugins
" -----------------------------------------------------------------------------

call plug#begin()

" Autocompletion
Plug 'Shougo/neocomplete.vim'

" Error linting
Plug 'scrooloose/syntastic'

" Snippets
Plug 'SirVer/ultisnips'

" Easily quote/surround objects
Plug 'tpope/vim-surround'

" Vim/tmux navigation
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Plugin specific settings
" -----------------------------------------------------------------------------

" Enable neocomplete at startup and set tab to cylce through suggestions
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Use python3 for syntastic, and let it check header files
let g:syntastic_python_python_exec = '/path/to/python3'
let g:syntastic_cpp_check_header = 1

" Bind C-f (forward) to expand snippets and cycle foward and C-b (backward) to 
" cycle backward
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" General settings
" -----------------------------------------------------------------------------
  
" Make bakscapce behave normally
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

" Spell check for markdown
autocmd FileType markdown setlocal spell

" Close scratch window
set completeopt-=preview

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

" Leader keybinds
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>f /
nnoremap <leader>fr :%s/
nnoremap <leader>n :noh<cr>
nnoremap <leader>v <C-v>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>sp :split<cr>

" Status line
" -----------------------------------------------------------------------------

" Turn on status line
set laststatus=2

" Status line format
set statusline=\ →\ %F%=[%l/%L]\ 

" Status line colors
hi StatusLine cterm=none ctermbg=235 ctermfg=015
