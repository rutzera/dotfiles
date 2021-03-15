" basic settings
""""""""""""""""""""""""""
"let mapleader= " "
set encoding=utf-8
syntax on "syntax highlighting
set nocompatible "not VI-compatible
filetype off "required for YouCompleteMe
set number "set linenumbers
set relativenumber "Show line number on the current line and relative numbers on all other lines.
set showcmd "set cursorline
set cursorline
set wildmenu "autocompletion
set showmatch "matching brackets
set hidden "hide buffers when they are abadoned
set noswapfile "disable swap files
"set shell='termite'
:setlocal spell spelllang=en_gb

" UI
""""""""""""""""""""""""""
"set colorscheme='wombat256mod' "Change color scheme.
set noerrorbells "Disable beep on errors.
set title "Set the window’s title, reflecting the file currently being edited.
set mouse=a "enable ouse usage (all mode)
set textwidth=79
set laststatus=2 "set statusbar

" Turn on syntax highlighting if more than 1 color is available
if &t_Co > 1
    syntax enable
endif

"True Colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif



" Set status line display
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
set showmode
set showcmd

" searching
set ignorecase "do case insensitive matching
set smartcase "do smart case matching
set incsearch "incremental search
set hlsearch "Enable search highlighting.

"Set the tab key to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab "Convert tabs to spaces.
set smarttab "Insert “tabstop” number of spaces when the “tab” key is pressed.

"plugin 
""""""""""""""""""""""""""""""""""""""
call plug#begin()
"(a)  NERDtree
Plug 'Npreservim/nerdcommenter'
Plug 'preservim/NERDTree'

" (b) fuzzyfinder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"dark nord theme
"Plug 'arcticicestudio/nord-vim'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

"(c) gruvbox color sheme
"Plug 'morhetz/gruvbox'


" rainbowcolored  bracket matching 
Plug 'frazrepo/vim-rainbow'

"(d)l ightline
Plug 'itchyny/lightline.vim'
"(e) bracket matching
Plug 'jiangmiao/auto-pairs'
"(f) syntax checking and semantic errors
Plug 'dense-analysis/ale'

"CSS colour
Plug 'ap/vim-css-color'

"""Programming
"enable SimpylFold
Plug 'tmhedberg/SimpylFold' 
"enable YouCompleteMe - different auto-completers
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
Plug 'vim-syntastic/syntastic'


:call plug#end()


""""""""""""""""""""""""""""""""""""""""""


"enable NERDtree commenter
let g:NERDCreateDefaultMappings = 1

"enable colorscheme 
""""""""""
"guvbox 
"autocmd vimenter * ++nested colorscheme gruvbox
"set background=dark "Use colors that suit a dark background.
"let g:rainbow_active=1

"dark nork
"colorscheme nord

"onehalflight
colorscheme onehalfdark


"enable lightline color line
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ]]},
      \ 'component': {
      \   'filename': '%F',},}

"enable auto-pair - brackets
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

"enable (f) syntax checking and semantic errors
let g:ale_linters = {'rust': ['rustc']}


" programing
""""""""""""""""""""""""""""""""""""""
"split view navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar - type za to fold (and unfold). 
nnoremap <space> za
"Python highlighting
"let python_highlight_all=1

