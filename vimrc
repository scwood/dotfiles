set nocompatible

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin()

Plug 'ervandew/supertab' " autocompletion
Plug 'jiangmiao/auto-pairs' " auto insert brackets
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } " fuzzy find
Plug 'kien/ctrlp.vim' " fuzzy finder for gvim
Plug 'scwood/vim-hybrid' " colorscheme
Plug 'tpope/vim-commentary' " comment out blocks
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown settings

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" vim-markdown
let g:markdown_fenced_languages = ['java', 'python', 'javascript']

" ------------------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------------------

syntax on " turn on syntax highlighting
colorscheme hybrid

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
set t_vb= " make visual bell blank

set guioptions-=r " remove right scrollbar from gui

" set laststatus=2 " keep status line on and change the format
" set statusline=\ →\ %F%=[%l/%L]
" set statusline=\ \ %F%=[%l/%L]

set autoindent " copy indent from previous when starting new line
set smartindent " smart newline autoindenting for languages
set expandtab " use spaces for tabs
set tabstop=4 " pressing tab will insert four spaces
set shiftwidth=4 " use four spaces for indents
set softtabstop=4 " backspace deletes four spaces tab inserts two spaces

" python/markdown/text specific indentation
" au FileType markdown,python,text,yaml set shiftwidth=4
" au FileType markdown,python,text,yaml set softtabstop=4
" au FileType markdown,python,text,yaml set tabstop=4

" ------------------------------------------------------------------------------
" key mappings
" ------------------------------------------------------------------------------

map j gj
map k gk
map <space> <leader>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>z 1z=e
nnoremap <leader>wc :w <bar> !wc %<cr>
nnoremap <leader>p :FZF<cr>
