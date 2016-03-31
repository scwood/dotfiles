" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin()

" editor
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'xml'] }
Plug 'scwood/vim-hybrid'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" language
Plug 'hynek/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'

" vim/nvim specifc
if has('nvim')
  Plug 'benekastah/neomake'
  Plug 'Shougo/deoplete.nvim'
else
  Plug 'ervandew/supertab'
  Plug 'scrooloose/syntastic'
endif

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

let g:user_emmet_expandabbr_key='<c-e>'

if has('nvim')
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  autocmd! BufWritePost * Neomake
  let g:deoplete#enable_at_startup = 1
  let g:neomake_verbose = 0
  let g:neomake_error_sign = {'text': '>>', 'texthl': 'ErrorMsg'}
  let g:neomake_warning_sign = {'text': '>>', 'texthl': 'Title'}
else
  let g:SuperTabDefaultCompletionType = '<c-n>'
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_python_python_exec = '/usr/local/bin/python3'
endif

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
set tabstop=2 " existing tabs are shown as four columns
set shiftwidth=2 " use four spaces for indents
set softtabstop=2 " in insert mode, backspace deletes four, tab inserts four

set laststatus=2 " leave status line on
set statusline=\ %f " file name
set statusline+=\ %y " filetype
set statusline+=\ %m " modified flag
set statusline+=%= " switch to the right side
set statusline+=%l:%c\  " current line, character and percentage in file

if !has('nvim')
  set encoding=utf-8 " the encoding displayed
  set fileencoding=utf-8 " the encoding written
endif

" ------------------------------------------------------------------------------
" filetype specific settings
" ------------------------------------------------------------------------------

autocmd FileType gitcommit,markdown,text setlocal spell
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown,text setlocal linebreak 
autocmd FileType python,make setlocal tabstop=4 shiftwidth=4 softtabstop=4

" ------------------------------------------------------------------------------
" key mappings
" ------------------------------------------------------------------------------

map j gj
map k gk
nnoremap <c-s> :update<cr>
nnoremap Q @q
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>

map <space> <leader>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :w <bar> !wc %<cr>
nnoremap <leader>f :BLines<cr>
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>t :FZF<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>v :sp<cr>:e $MYVIMRC<cr>
nnoremap <leader>z 1z=e

if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif
