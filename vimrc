" Turn off VI compatability
set nocompatible

" Installed plugins
" -----------------------------------------------------------------------------

call plug#begin()

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

" Snippet settings
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Turn off code folding for vim-markdown
let g:vim_markdown_folding_disabled=1

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

" Turn autoindent on
set autoindent

" File specific indenting
if has('autocmd')
  filetype plugin indent on
endif

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
