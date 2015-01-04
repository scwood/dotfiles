" Turn off vi compatability
set nocompatible

" Installed plugins
" -----------------------------------------------------------------------------

call plug#begin()

" Autocomplete
Plug 'Shougo/neocomplete.vim'

" Error linting
Plug 'scrooloose/syntastic'

" Code snipptes 
Plug 'SirVer/ultisnips'

" Markdown improvements
Plug 'plasticboy/vim-markdown'

" Surround objects easier
Plug 'tpope/vim-surround'

" Easy nagivating between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Plugin specific settings
" -----------------------------------------------------------------------------

" Use python3 for syntastic rather than python2
let g:syntastic_python_python_exec = '/path/to/python3'

" Set shift-tab to expand snippet and cycle foward, ctrl-b to cycle backward
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" Turn off code folding for vim-markdown
let g:vim_markdown_folding_disabled=1

" Enable neocomplete at startup and set tab to cylce through suggestions
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" General settings
" -----------------------------------------------------------------------------
  
" Turn on syntax highlighting
syntax on

" Colorscheme
set background=dark
colorscheme jellybeans

" Make bakscapce behave normally
set backspace=indent,eol,start

" Turn on line numbers 
set number

" Use system clipboard
set clipboard=unnamed

" Set 80 character ruler
set colorcolumn=80

" Highlight current line
set cursorline

" Set a scrolling buffer near the top and bottom of the screen
set scrolloff=1

" Turn autoindent on
set autoindent

" File specific indenting
if has('autocmd')
  filetype plugin indent on
endif

" Highlight, incrament, and smartcase search
set incsearch
set hlsearch
set ignorecase
set smartcase 

" Tab will insert two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Turn off backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Keybinds
" -----------------------------------------------------------------------------

" jk to escape insert mode, and save the file
inoremap jk <ESC>:w<cr>

" Set leader to space
map <space> <leader>

" Leader keybinds
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>f /
nnoremap <leader>fr :%s/

" Status line
" -----------------------------------------------------------------------------

" Turn status line on always
set laststatus=2

" Status bar format
set statusline=\ →\ %F%=[%l/%L]\ 

" Status bar colors invert during insert mode, does not work with C-c
hi StatusLine cterm=none ctermbg=235 ctermfg=015
au InsertLeave * hi StatusLine cterm=none ctermfg=015 ctermbg=235
au InsertEnter * hi StatusLine cterm=none ctermfg=235 ctermbg=015
