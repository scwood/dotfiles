set nocompatible

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin()

Plug 'Glench/Vim-Jinja2-Syntax' " jinja template language support
Plug 'christoomey/vim-tmux-navigator' " easy navigation between vim/tmux splits
Plug 'ervandew/supertab' " uses tab to choose autocomplete suggestions
Plug 'godlygeek/tabular' " align by characters
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'} " better python format
Plug 'jiangmiao/auto-pairs' " close braces, quotes, etc. automatically
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " fuzzy finder
Plug 'junegunn/fzf.vim' " vim extensions for fzf
Plug 'mattn/emmet-vim', {'for': ['html', 'xml']} " create HTML tags more easily
Plug 'pangloss/vim-javascript' " improved javascript support
Plug 'scrooloose/syntastic' " linting
Plug 'scwood/vim-hybrid' " colorscheme
Plug 'tpope/vim-commentary' " comment out blocks easier
Plug 'tpope/vim-markdown', {'for': 'markdown'} " markdown enhancements
Plug 'tpope/vim-repeat' " allow repeatable plugin actions
Plug 'tpope/vim-surround' " easily surround things with quotes, braces, etc.

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

let g:SuperTabDefaultCompletionType = '<c-n>'
let g:markdown_fenced_languages = ['python']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:user_emmet_expandabbr_key='<c-e>'

" ------------------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------------------

syntax on " turn on syntax highlighting
set background=dark
colorscheme hybrid

set backspace=indent,eol,start " make backspace behave normally
set clipboard=unnamed " use system clipboard
set cursorline " show what line you're currently on
set mouse=a " enable mouse
set number " turn on line numbers
set scrolloff=3 " set a three line scrolling buffer at the top and bottom

set encoding=utf-8 " the encoding displayed
set fileencoding=utf-8 " the encoding written

set hlsearch " highlight search
set incsearch " jump to closest instance during search
set ignorecase " case insensitive search
set smartcase " if using a capital, search becomes case sensitive

set writebackup " make backup file during file overwrite
set nobackup " delete backup after file is written
set noswapfile " turn off swap files

set visualbell " enable visual bell in order to disable beeping
set t_vb= " make visual bell blank (effectively turning off all bells)

set autoindent " copy indent from previous when starting new line
set smartindent " smart newline autoindenting for languages
set expandtab " use spaces for tabs
set tabstop=4 " existing tabs are shown as four columns
set shiftwidth=4 " use four spaces for indents
set softtabstop=4 " in insert mode, backspace deletes four, tab inserts four

set laststatus=2 " leave status line on
set statusline=\ %f " file name
set statusline+=\ %y " filetype
set statusline+=\ %m " modified flag
set statusline+=%= " switch to the right side
set statusline+=%l:%c\  " current line, character and percentage in file

" ------------------------------------------------------------------------------
" filetype specific settings
" ------------------------------------------------------------------------------

autocmd FileType gitcommit,markdown,text setlocal spell
autocmd FileType html,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown,text setlocal linebreak 

" ------------------------------------------------------------------------------
" key mappings
" ------------------------------------------------------------------------------

map j gj
map k gk

nnoremap Q @q

nnoremap <c-s> :update<cr>
inoremap <c-s> <c-o>:update<cr><esc>

nnoremap <c-q> :q<cr>
inoremap <c-q> <c-o>:q<cr>

nnoremap <c-x> :wq<cr>
inoremap <c-x> <c-o>:wq<cr>

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

nnoremap ]e :lnext<cr>
nnoremap [e :lprev<cr>

nnoremap ]t :tabnext<cr>
nnoremap [t :tabprev<cr>

map <space> <leader>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :w <bar> !wc %<cr>
nnoremap <leader>f :BLines<cr>
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>p :FZF<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>v :sp<cr>:e $MYVIMRC<cr>
nnoremap <leader>w :tabclose<cr>
nnoremap <leader>z 1z=e
