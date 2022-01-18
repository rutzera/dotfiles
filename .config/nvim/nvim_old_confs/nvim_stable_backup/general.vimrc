"basic settings
""""""""""""""""""""""""""""""""""
set encoding=utf-8
set number "set linenumbers
set relativenumber "show relative linenumbers
set noerrorbells "disable beep on errors
set nowrap "no line wrapping
set noswapfile
set nobackup
set nowritebackup
"set undodir
""set undofile
set scrolloff=10 "start scrolling before cursor is at the end of document
set mouse=a "enable mouse usage (all mode)
"set colorcolumn=80
"set signcolumn=yes
set cursorline
syntax on
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set clipboard=unnamedplus "Copy/paste between vim and other programs

"" searching
set ignorecase "do case insensitive matching
set smartcase "do smart case matching
set incsearch "incremental search
"set hlsearch "Enable search highlighting.
"set nohlsearch "turns of highlighted searches

""Set the tab key to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab "Convert tabs to spaces.
set smarttab "Insert “tabstop” number of spaces when the “tab” key is pressed.
set autoindent
set smartindent

" Set status line display
set noshowmode
set showcmd 

