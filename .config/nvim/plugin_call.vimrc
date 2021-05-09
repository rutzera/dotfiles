"Plugins
""""""""""""""""""""""""""""""""""
call plug#begin()
"colour scheme
Plug 'gruvbox-community/gruvbox'
"lightline
Plug 'itchyny/lightline.vim'

" rainbowcolored  bracket matching 
Plug 'frazrepo/vim-rainbow'
"bracket matching
Plug 'jiangmiao/auto-pairs'

"CoC
Plug 'neoclide/coc.nvim',  {'branch': 'release'}

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"nerdTree
Plug 'scrooloose/nerdTree'
"nerdCommennter
Plug 'preservim/nerdcommenter'

"vim-fugitive
Plug 'tpope/vim-fugitive'
call plug#end()



