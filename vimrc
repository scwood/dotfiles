" Turn off VI compatability
set nocompatible

" Vundle initilization
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Installed plugins
" -----------------------------------------------------------------------------

" Auto insert closing brackets
Plugin 'Raimondi/delimitMate'

" Error linting
Plugin 'scrooloose/syntastic'

" Code snipptes 
Plugin 'SirVer/ultisnips'

" Markdown improvements
Plugin 'plasticboy/vim-markdown'

" Easy surround for words
Plugin 'tpope/vim-surround'

" Easily switch between vim and tmux
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on

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

" Highlight and incramental search
set incsearch
set hlsearch

" Tab will insert four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Make backspace behave like normal
set backspace=indent,eol,start

" Hide insert status
set noshowmode

" Set scroll buffer zone
set scrolloff=3

" Keybinds
" -----------------------------------------------------------------------------

" Stop using arrows in insert mode
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

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
