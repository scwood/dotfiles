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
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'javascript.jsx'] }
Plug 'scrooloose/nerdtree'
Plug 'scwood/vim-hybrid'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" language
Plug 'hynek/vim-python-pep8-indent'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'

" vim/nvim specifc
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'benekastah/neomake'
else
  Plug 'ervandew/supertab'
  Plug 'scrooloose/syntastic'
endif

call plug#end()

" ------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------

" emmet-vim
let g:user_emmet_expandabbr_key='<c-e>'

" vim-jsx
let g:jsx_ext_required = 0

if has('nvim')

  " deoplete.nvim
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#file#enable_buffer_path = 1
  set completeopt-=preview

  " neomake
  autocmd! BufWritePost * Neomake
  let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
  let g:neomake_javascript_eslint_exe = 
        \ substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
  let g:neomake_error_sign = {'text': '>>', 'texthl': 'ErrorMsg'}
  let g:neomake_warning_sign = {'text': '>>', 'texthl': 'Title'}

else

  " supertab
  let g:SuperTabDefaultCompletionType = '<c-n>'

  " syntastic
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_python_python_exec = '/usr/local/bin/python3'

endif

" ------------------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------------------

syntax on
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

set autoindent " copy indent from previous line when starting new line
set smartindent " smart newline autoindenting for languages
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

" only show cursorline on selected buffer
augroup CursorLine
  au!
  au BufWinEnter,VimEnter,WinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" ------------------------------------------------------------------------------
" filetype specific settings
" ------------------------------------------------------------------------------

au FileType gitcommit,markdown,text setlocal spell
au FileType make setlocal noexpandtab
au FileType markdown,text setlocal linebreak 
au FileType python,make setlocal tabstop=4 shiftwidth=4 softtabstop=4
au FileType php setlocal nocursorline
au BufNewFile,BufRead {.babel,.eslint}rc set filetype=json

" ------------------------------------------------------------------------------
" key mappings
" ------------------------------------------------------------------------------

map j gj
map k gk
nnoremap * *N
nnoremap <c-q> :q<cr>
nnoremap <c-s> :update<cr>
nnoremap Q @q
nnoremap [t :tabp<cr>
nnoremap ]t :tabn<cr>

map <space> <leader>
nnoremap <leader>- yypVr-
nnoremap <leader>; $a;<esc>
nnoremap <leader><s-f> :Ag<cr>
nnoremap <leader>= yypVr=
nnoremap <leader>\ :NERDTreeToggle<cr><c-w>=
nnoremap <leader>a ggVG
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :w <bar> !wc %<cr>
nnoremap <leader>f :BLines<cr>
nnoremap <leader>l :lopen<cr>
nnoremap <leader>n :noh<cr>:let @/ = ""<cr>:<backspace>
nnoremap <leader>r *N:%s/\<<c-r><c-w>\>//g<left><left>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>t :FZF<cr>
nnoremap <leader>v :sp<cr>:e $MYVIMRC<cr>
nnoremap <leader>z 1z=e

if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif
