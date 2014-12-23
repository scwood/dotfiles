" Turn off VI compatability
set nocompatible

" Vundle initilization
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
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

" Map jk to escape
inoremap jk <ESC>

" Jump up a line after completing brace
inoremap { {<ESC>o}<ESC><S-o>

" Nerd tree toggle
map <C-n> :NERDTreeToggle<CR>

" ` saves in command mode
map ` :w! <CR>

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
