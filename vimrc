" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin()

" editor
Plug 'Shougo/neocomplete.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ddrscott/vim-side-search'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'javascript.jsx'] }
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'scrooloose/nerdtree'
Plug 'scwood/vim-hybrid'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" language
Plug 'hynek/vim-python-pep8-indent'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

" neocomplete
let g:neocomplete#enable_at_startup = 1

" emmet-vim
let g:user_emmet_expandabbr_key='<c-e>'

" fzf.vim
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
endif

" supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

" vim-jsx
let g:jsx_ext_required = 0

" ------------------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------------------

syntax on
set background=dark
colorscheme hybrid

set backspace=indent,eol,start " make backspace behave normally
set clipboard=unnamed " use system clipboard
set completeopt-=preview " disable preview window on autocomplete
set mouse=a " enable mouse
set number " turn on line numbers
set scrolloff=3 " set a three line scrolling buffer at the top and bottom
set completeopt-=preview " disable autocomplete window

set hlsearch " highlight search
set incsearch " jump to closest instance during search
set ignorecase " case insensitive search
set smartcase " if using a capital, search becomes case sensitive

set writebackup " make backup file during file overwrite
set nobackup " delete backup after file is written
set noswapfile " turn off swap files

set visualbell " enable visual bell in order to disable beeping
set t_vb= " make visual bell blank (effectively turning off all bells)

filetype plugin indent on
set autoindent " copy indent from previous when starting new line
set cindent " smart newline autoindenting for languages
set expandtab " use spaces for tabs
set tabstop=2 " existing tabs are shown as two columns
set shiftwidth=2 " use two spaces for indents
set softtabstop=2 " in insert mode, backspace deletes two, tab inserts two

set laststatus=2 " leave status line on
set statusline=\ %f " file name
set statusline+=\ %y " file type
set statusline+=\ %{fugitive#statusline()} " git info
set statusline+=\ %m " modified flag
set statusline+=%= " switch to the right side
set statusline+=%l:%c\  " current line, character and percentage in file

" persistent undo after closing
if has('persistent_undo')
  if !isdirectory($HOME . "/.vim/backups")
    call mkdir($HOME . "/.vim/backups", "p")
  endif
  set undodir=~/.vim/backups
  set undofile 
endif

" ------------------------------------------------------------------------------
" filetype specific settings
" ------------------------------------------------------------------------------

au FileType gitcommit set spell
au FileType make setlocal noexpandtab
au FileType markdown,text setlocal linebreak 
au FileType python,make setlocal tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead {.babel,.eslint}rc set filetype=json

" ------------------------------------------------------------------------------
" default keybinds
" ------------------------------------------------------------------------------

map j gj
map k gk

nnoremap * *N
nnoremap Q @q

nnoremap <c-q> :q<cr>
nnoremap <c-s> :update<cr>

nnoremap [t :tabp<cr>
nnoremap ]t :tabn<cr>

nnoremap <s-tab> <<
vnoremap <s-tab> <<
nnoremap <tab> >>
vnoremap <tab> >>

" ------------------------------------------------------------------------------
" leader keybinds
" ------------------------------------------------------------------------------

map <space> <leader>

nnoremap <leader><s-f> :SideSearch 
nnoremap <leader>\ :NERDTreeToggle<cr><c-w>=
nnoremap <leader>a ggVG
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :w <bar> !wc %<cr>
nnoremap <leader>f :BLines<cr>
nnoremap <leader>l :lopen<cr>
nnoremap <leader>m :%s/<c-v><c-m>/<c-v><cr>/g<cr>
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>r *N:%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>t :FZF<cr>
nnoremap <leader>v :sp<cr>:e $MYVIMRC<cr>
nnoremap <leader>z 1z=e

nnoremap <leader>, $a,<esc>
nnoremap <leader>; $a;<esc>

nnoremap <leader>- yypVr-
nnoremap <leader>= yypVr=

