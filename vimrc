" Turn off VI compatability
set nocompatible

" Vundle initilization
" -----------------------------------------------------------------------------

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Ctrl p to quickly switch to files
Plugin 'kien/ctrlp.vim'

" Vundle plugin manager
Plugin 'gmarik/Vundle.vim'

" Nerdtree file viewer
Plugin 'scrooloose/nerdtree'

" Syntastic error linting
Plugin 'scrooloose/syntastic'

" Easily switch between vim and tmux
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on

" General options
" -----------------------------------------------------------------------------

" Turn off backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Buffers exist like in normal editors
set hidden

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

" Keybinds
" -----------------------------------------------------------------------------

" Stop using arrows in insert mode
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" jk to escape in insert mode
inoremap jk <ESC>
xnoremap jk <ESC> 

" C-n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>

" ` saves in command mode
map ` :w! <CR>

" Set leader to space
map <space> <leader>

" Leader keybinds
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>f /

" Status bar options
" -----------------------------------------------------------------------------

set laststatus=2
hi StatusLine ctermbg=235
hi StatusLine ctermfg=white
set statusline=
set statusline+=\ 
set statusline+=→
set statusline+=\ 
set statusline+=%f
set statusline+=%=
set statusline+=%l/%L
set statusline+=\ 
