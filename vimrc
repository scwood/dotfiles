" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin()

Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ddrscott/vim-side-search'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'javascript.jsx'] }
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'metakirby5/codi.vim'
Plug 'scrooloose/nerdtree'
Plug 'scwood/vim-hybrid'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

" delimitMate
let delimitMate_expand_cr=1

" emmet-vim
let g:user_emmet_expandabbr_key='<c-e>'

" fzf.vim
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --follow -g ""'
endif

" neocomplete
let g:neocomplete#enable_at_startup = 1

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
set statusline=
set statusline+=\ %f " file name
set statusline+=\ %y " file type
set statusline+=\ [%n]
set statusline+=\ %{fugitive#statusline()} " git info
set statusline+=\ %m " modified flag
set statusline+=%= " switch to the right side
set statusline+=\ %l:%c\/%L\  " current line

" persistent undo even after closing
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

autocmd BufNewFile,BufRead {.babel,.eslint}rc set filetype=json
autocmd FileType gitcommit set spell
autocmd FileType julia setlocal commentstring=#\ %s
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown,text setlocal linebreak 
autocmd FileType python,make setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType sql,php NeoCompleteLock

" ------------------------------------------------------------------------------
" default keybinds
" ------------------------------------------------------------------------------

map j gj
map k gk

inoremap jk <esc>

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
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>r *N:%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>t :FZF<cr>
nnoremap <leader>v :sp<cr>:e $MYVIMRC<cr>
nnoremap <leader>z 1z=e

nnoremap <leader>, $a,<esc>
nnoremap <leader>; $a;<esc>

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
