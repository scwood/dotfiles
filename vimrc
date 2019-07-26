if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($HOME . '/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'bronson/vim-visual-star-search'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdtree'
Plug 'scwood/vim-hybrid'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_cache_dir = $HOME . '/.gutentags'

Plug 'maralla/completor.vim', { 'do': 'make js' }
let g:completor_refresh_always = 0
let g:completor_node_binary = '/usr/local/bin/node'
let g:completor_complete_options='menuone,noselect'

Plug 'fatih/vim-go'
let g:go_fmt_autosave = 0

Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<c-n>'

Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg  --files --hidden --follow'
endif

" Plug 'w0rp/ale'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_fix_on_save = 1
" let g:ale_fixers = { 'javascript': ['eslint'], 'go': ['gofmt'] }
" let g:ale_linters = { 'javascript': ['eslint'], 'html': [], 'go': ['govet'] }

if !empty(glob($HOME . '/.vimrc_local'))
  source $HOME/.vimrc_local
endif

call plug#end()

syntax on
set background=dark
colorscheme hybrid

set autoread " when a file changes outside vim, change it inside vim as well
set autowrite " if a file changes on disk, reload it
set backspace=indent,eol,start " make backspace behave normally
set clipboard=unnamed " use system clipboard
set hidden " allow switching between buffers with unsaved changes
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
  if !isdirectory($HOME . '/.vim/backups')
    call mkdir($HOME . '/.vim/backups', 'p')
  endif
  set undodir=~/.vim/backups
  set undofile
endif

" remember last position on exit
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
      \ | exe "normal! g'\"" | endif

" filetype autocommands
autocmd BufNewFile,BufRead {.babel,.eslint,.prettier}rc set filetype=json
autocmd FileType gitcommit,gitrebase set spell | CompletorDisable
autocmd FileType julia setlocal commentstring=#\ %s
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown,text setlocal linebreak 
autocmd FileType php ALEDisable
autocmd FileType python,cs,make setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufEnter * set cursorline
autocmd BufLeave * set nocursorline

nnoremap j gj
nnoremap k gk

nnoremap Q @q

nnoremap <c-q> :q<cr>
nnoremap <c-s> :w<cr>

nnoremap [e :ALEPrevious<cr>
nnoremap ]e :ALENext<cr>

map <Space> <leader>

nnoremap <leader>2 :setlocal tabstop=2 shiftwidth=2 softtabstop=2<cr>
nnoremap <leader>4 :setlocal tabstop=4 shiftwidth=4 softtabstop=4<cr>

nnoremap <leader>p :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :BLines<cr>
nnoremap <leader>r :BTags<cr>
nnoremap <leader><s-r> :Tags<cr>
nnoremap <leader><s-f> :GrepperRg<space>

nnoremap <leader>o :!open .<cr>
nnoremap <leader>os :!subl .<cr>

nnoremap <leader>, mz$a,<esc>`z
nnoremap <leader>. mz$a.<esc>`z
nnoremap <leader>; mz$a;<esc>`z

nnoremap <leader>- :resize -5<cr>
nnoremap <leader>= :resize +5<cr>

nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>v <Plug>yankstack_substitute_older_paste
nnoremap <leader>V <Plug>yankstack_substitute_newer_paste

nnoremap <leader>\ :NERDTreeToggle<cr><c-w>=
nnoremap <leader>a ggVG
nnoremap <leader>m :tabnew %<cr>
nnoremap <leader>n :noh<cr>
nnoremap <leader>so vip:sort<cr>
nnoremap <leader>sr *N:%s/\<<c-r><c-w>\>/<c-r><c-w>/g<left><left>
nnoremap <leader>w :set nowrap!<cr>
nnoremap <leader>z 1z=e

tnoremap <esc> <c-\><c-n>
tnoremap <c-j> <c-w>j
tnoremap <c-h> <c-w>h
tnoremap <c-k> <c-w>k
tnoremap <c-l> <c-w>l
