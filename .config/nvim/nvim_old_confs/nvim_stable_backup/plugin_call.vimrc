" Plugins
""""""""""""""""""""""""""""""""""
    call plug#begin("~/.config/nvim/plugged")

    " UI
    Plug 'sainnhe/gruvbox-material'                     "colour scheme
    Plug 'itchyny/lightline.vim'                        "lightline statusbar
    " fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf - FuzzyFinder
    Plug 'junegunn/fzf.vim'                             "fzf - FuzzyFinder
    " filemanagement
    Plug 'scrooloose/nerdTree'                          "nerdTree - Files Tree Overview
    Plug 'Xuyuanp/nerdtree-git-plugin'                  "showing git status in nerdtree
    Plug 'rafaqz/ranger.vim'                            "ranger in vim
    Plug 'ryanoasis/vim-devicons'                       " Adds filetype-specific icons
    " git
    Plug 'tpope/vim-fugitive'                           "vim-fugitive - execute git commands
    Plug 'airblade/vim-gitgutter'                       " shows git changes in gutter
    " IDE - generel
    Plug 'preservim/nerdcommenter'                      "nerdCommennter
    Plug 'jiangmiao/auto-pairs'                         "bracket matching
    " R-IDE
    Plug 'jalvesaq/Nvim-R'                              "R IDE
    Plug 'ncm2/ncm2'                                    " completion [dep]: nvim-0.2.2, nvim-yarp, python3
    Plug 'roxma/nvim-yarp'
    Plug 'gaalcaras/ncm-R'                              "based on ncm2 and ncm-R

call plug#end()

" TODO
" vim ale autocomletion
    " Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'
    " Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'
    " Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
    " Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
    " Plug 'ncm2/ncm2-bufword'             " complete words in buffer
    " Plug 'ncm2/ncm2-path'                " complete paths
    " Plug 'tpope/vim-surround'            " replace surrounding characters
    " Plug 'dense-analysis/ale'            " linting [dep]: pip3 install flake8, install.packages('lintr')
    " Plug 'karoliskoncevicius/vim-sendtowindow' " send text from one window to another
        " " <space>l sends to the right window
        " " <space>k sends to the top window
        " " <space>j sends to the bottom window
        " " <space>h sends to the left window
    " " R-IDE
    " Plug 'gaalcaras/ncm-R' "autocomletion
    " " pyhton
    " Plug 'ncm2/ncm2-jedi'                " Python completion
"
    " Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
    " Plug 'ncm2/ncm2-bufword'             " complete words in buffer
    " Plug 'ncm2/ncm2-path'                " complete paths
    " Plug 'ncm2/ncm2-jedi'                " Python completion
    " Plug 'gaalcaras/ncm-R'               " R completion [dep]: ncm2, Nvim-R
    " Plug 'jalvesaq/Nvim-R'               " required for ncm-R
    " Plug 'dense-analysis/ale'            " linting [dep]: pip3 install flake8, install.packages('lintr')
    " Plug 'fisadev/vim-isort'             " Python sort imports [dep]: pip3 install isort
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Plug 'tpope/vim-surround'            " replace surrounding characters
    " Plug 'filipekiss/ncm2-look.vim'      " ncm2 spelling
    " Plug 'SirVer/ultisnips'              " hotkeys for chunks of code

" coc conflicts with Nvim-R IDE
    " Plug 'neoclide/coc.nvim', {'branch': 'release'} "CoC - language autocompleter
