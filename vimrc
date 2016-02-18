set nocompatible

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin()

Plug 'Glench/Vim-Jinja2-Syntax' " jinja support
Plug 'christoomey/vim-tmux-navigator' " easy navigation between vim/tmux splits
Plug 'ervandew/supertab' " uses tab to choose autocomplete suggestions
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'} " better python format
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'} " fuzzy finder
Plug 'mattn/emmet-vim' " vim support for emmet
Plug 'scrooloose/syntastic' " linting
Plug 'scwood/vim-hybrid' " colorscheme
Plug 'tpope/vim-commentary' " binds gcc to comment out blocks
Plug 'tpope/vim-markdown', {'for': 'markdown'} " markdown enhancements
Plug 'tpope/vim-surround' " easily surround things with quotes and braces

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

let g:SuperTabDefaultCompletionType = '<c-n>'
let g:user_emmet_expandabbr_key='<c-e>'

" ------------------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------------------

syntax on " turn on syntax highlighting
colorscheme hybrid

set encoding=utf-8 " the encoding displayed
set fileencoding=utf-8 " the encoding written to file

set backspace=indent,eol,start " make backspace behave normally
set clipboard=unnamed " use system clipboard
set mouse=a " enable mouse
set number " turn on line numbers
set scrolloff=3 " set a three line scrolling buffer at the top and bottom

set hlsearch " highlight search
set incsearch " jump to closest instance during search
set ignorecase " case insensitive search
set smartcase  " if using a capital, search becomes case sensitive search

set writebackup " make backup file during file overwrite
set nobackup " delete backup after file is written
set noswapfile " turn off swap files

set visualbell " enable visual bell in order to disable beeping
set t_vb= " make visual bell blank (effectively turning off all bells)

set autoindent " copy indent from previous when starting new line
set smartindent " smart newline autoindenting for languages
set expandtab " use spaces for tabs
set tabstop=4 " pressing tab will insert four spaces
set shiftwidth=4 " use four spaces for indents
set softtabstop=4 " backspace deletes four spaces tab inserts two spaces

set laststatus=2 " leave status line on
set statusline=\ %t " file name
set statusline+=\ %y " filetype
set statusline+=\ %m " modified flag
set statusline+=%= " switch to the right side
set statusline+=%l:%c\  " current line, character and percentage in file

" ------------------------------------------------------------------------------
" filetype specific settings
" ------------------------------------------------------------------------------

autocmd FileType gitcommit,markdown,text setlocal spell
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown,text setlocal linebreak 

" ------------------------------------------------------------------------------
" key mappings
" ------------------------------------------------------------------------------
map j gj
map k gk

map <space> <leader>
nnoremap <leader>b :ls<cr>:b
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>p :FZF<cr>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>v :sp<cr>:e $MYVIMRC<cr>
nnoremap <leader>wc :w <bar> !wc %<cr>
nnoremap <leader>z 1z=e
