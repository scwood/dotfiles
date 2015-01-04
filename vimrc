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

" Easy surround for words
Plug 'tpope/vim-surround'

" Easily switch between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" Autocompletion
Plug 'Shougo/neocomplete.vim'

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

" Highlight, incramental, and smartcase search
set incsearch
set hlsearch
set ignorecase
set smartcase 

" Tab will insert four spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Make backspace behave like normal
set backspace=indent,eol,start

" Hide insert status
set noshowmode

" Set scroll buffer zone
set scrolloff=3

" Keybinds
" -----------------------------------------------------------------------------

" jk to escape insert mode, clear highlights, and save the file
inoremap jk <ESC>:w <bar> noh<cr>

" Set leader to space
map <space> <leader>

" Leader keybinds
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>f /
nnoremap <leader>fr :%s/

" Status line
" -----------------------------------------------------------------------------

" Turn status line always on
set laststatus=2

" Status bar format
set statusline=\ 
set statusline+=→\ 
set statusline+=%F
set statusline+=%=
set statusline+=[%l/%L]
set statusline+=\ 

" Status bar colors invert during insert mode, does not work with C-c
hi StatusLine cterm=none ctermbg=235 ctermfg=015
au InsertLeave * hi StatusLine cterm=none ctermfg=015 ctermbg=235
au InsertEnter * hi StatusLine cterm=none ctermfg=235 ctermbg=015
