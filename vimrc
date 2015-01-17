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

" Easily quote and surround objects
Plug 'tpope/vim-surround'

" Vim/tmux navigation
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Plugin specific settings
" -----------------------------------------------------------------------------

" Use python3 for syntastic rather than python2
let g:syntastic_python_python_exec = '/path/to/python3'

" Set shift-tab to expand snippets and cycle foward, ctrl-b to cycle backward
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" Enable neocomplete at startup and set tab to cylce through suggestions
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-g> neocomplete#undo_completion()

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

" Set 80 character ruler
set colorcolumn=80

" Set a one line scrolling buffer near the top and bottom of the screen
set scrolloff=3

" Turn autoindent on
set autoindent

" Turn on syntax highlighting
syntax on

" Colorscheme
set background=dark
colorscheme jellybeans

" Better rendering for the terminal
set lazyredraw
set ttyfast

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

" Turn off backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Keybinds
" -----------------------------------------------------------------------------

" In insert mode remap jk to escape insert mode
inoremap jk <ESC>

" Remap <C-c> to esc to play nice with color changing statusline
inoremap <C-c> <ESC>

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

" Status line format
set statusline=\ →\ %F%=[%l/%L]\ 

" Status line colors invert during insert mode, does not work with gui
au InsertLeave * hi StatusLine cterm=none ctermfg=015 ctermbg=235
au InsertEnter * hi StatusLine cterm=none ctermfg=235 ctermbg=015

" Default status line colors
hi StatusLine cterm=none ctermbg=235 ctermfg=015
