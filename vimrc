" Turn off VI compatability
set nocompatible

" Vundle initilization
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Installed plugins
" -----------------------------------------------------------------------------

" Autoshow suggestions
Plugin 'AutoComplPop'

" Ctrl p to quickly switch to files
Plugin 'kien/ctrlp.vim'

" Auto insert closing brackets
Plugin 'Raimondi/delimitMate'

" File viewer
Plugin 'scrooloose/nerdtree'

" Tab completion in insert mode
Plugin 'ervandew/supertab'

" Error linting
Plugin 'scrooloose/syntastic'

" Code snipptes 
Plugin 'SirVer/ultisnips'

" Easily switch between vim and tmux
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on

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

" Change supertab completion to be from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Snippet settings
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

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

" Status bar options
" -----------------------------------------------------------------------------

" Turn status bar always on
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
