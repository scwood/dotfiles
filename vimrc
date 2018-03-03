" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin()

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'bronson/vim-visual-star-search'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'maralla/completor.vim'
Plug 'mattn/emmet-vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdtree'
Plug 'scwood/vim-hybrid'
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install '}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

if !empty(glob("$HOME/.vimrc_local"))
  source $HOME/.vimrc_local
endif

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

" AndrewRadev/splitjoin.vim
let delimitMate_expand_cr = 1

" junegunn/fzf.vim
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --follow --ignore .git -g ""'
endif

" maralla/completor.vim
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
let g:completor_refresh_always = 0

" mattn/emmet-vim
let g:user_emmet_expandabbr_key = '<c-e>'

" ternjs/tern_for_vim
let g:tern_map_keys=1

" w0rp/ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_linters = { 'javascript': ['eslint'], 'html': [] }

" ------------------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------------------

syntax on
set background=dark
colorscheme hybrid

set autoread " when a file changes outside vim, change it inside vim as well
set backspace=indent,eol,start " make backspace behave normally
set clipboard=unnamed " use system clipboard
set completeopt-=preview " disable preview window on autocomplete
set mouse=a " enable mouse
set number " turn on line numbers
set scrolloff=3 " set a three line scrolling buffer at the top and bottom
set autowrite " if a file changes on disk, reload it

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

" remember last position on exit
if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
        \ | exe "normal! g'\"" | endif
endif

" ------------------------------------------------------------------------------
" filetype specific settings
" ------------------------------------------------------------------------------

autocmd BufNewFile,BufRead {.babel,.eslint,.prettier}rc set filetype=json
autocmd FileType gitcommit set spell
autocmd FileType julia setlocal commentstring=#\ %s
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown,text setlocal linebreak 
autocmd FileType python,cs,make setlocal tabstop=4 shiftwidth=4 softtabstop=4

" ------------------------------------------------------------------------------
" default keybinds
" ------------------------------------------------------------------------------

map j gj
map k gk

nnoremap Q @q

nnoremap <c-q> :q<cr>
nnoremap <c-s> :w<cr>

nnoremap [[ :bprev<cr>
nnoremap ]] :bnext<cr>
nnoremap [c :cprev<cr>
nnoremap ]c :cnext<cr>
nnoremap [t :tabprev<cr>
nnoremap ]t :tabnext<cr>

" ------------------------------------------------------------------------------
" leader keybinds
" ------------------------------------------------------------------------------

map <space> <leader>

nnoremap <leader>2 :setlocal tabstop=2 shiftwidth=2 softtabstop=2<cr>
nnoremap <leader>4 :setlocal tabstop=4 shiftwidth=4 softtabstop=4<cr>
nnoremap <leader><s-f> :Grepper<cr>
nnoremap <leader>\ :NERDTreeToggle<cr><c-w>=
nnoremap <leader>a ggVG
nnoremap <leader>c :w <bar> !wc %<cr>
nnoremap <leader>f :BLines<cr>
nnoremap <leader>gs :GitFiles?<cr>
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>o :!open .<cr>
nnoremap <leader>os :!subl .<cr>
nnoremap <leader>p :FZF<cr>
nnoremap <leader>r *N:%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <leader>w :set nowrap!<cr>
nnoremap <leader>z 1z=e

nnoremap <leader>, mz$a,<esc>`z
nnoremap <leader>. mz$a.<esc>`z
nnoremap <leader>; mz$a;<esc>`z

nnoremap <leader>- :resize -5<cr>
nnoremap <leader>= :resize +5<cr>

nnoremap <leader>ev :sp<cr>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nmap <leader>v <Plug>yankstack_substitute_older_paste
nmap <leader>V <Plug>yankstack_substitute_newer_paste
