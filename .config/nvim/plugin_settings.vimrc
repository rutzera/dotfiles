"Plugin Settings
""""""""""""""""""""""""""""""""""
filetype plugin indent on

""" colorscheme
colorscheme gruvbox-material
set background=dark
" Important!!
if has('termguicolors')
  set termguicolors
endif
" Set contrast. This configuration option should be placed before `colorscheme
" gruvbox-material`. Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'soft'


""" enable lightline color line
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [  'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \    'filename': '%F'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

""" nerdTree
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let NERDTreeQuitOnOpen = 1 "quti after opening a file
let NERDTreeAutoDeleteBuffer = 1 "automatically delete hte buffer of the file you just deleted with nerdTee
"let NERDTreeShowHidden=1 "always show hidden files ('shift i')
let NERDTreeIgnore = ['\.pyc$'] " ignore pyc files


""" nerdCommennter
" Create default mappings
let g:NERDCreateDefaultMappings = 1
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"""ranger plugin
" let g:ranger_terminal = 'terminte -e' "ranger needs to opne in seperate
" terminal when using a vim-gui
let g:NERDTreeHijackNetrw = 0 "add this line if you use NERDTree
let g:ranger_replace_netrw = 1 "open ranger when vim open a directory

""""Ale Linting
" let g:ale_sign_column_always=1
" let g:ale_lint_on_enter=1
" let g:ale_lint_on_text_changed='always'
" let g:ale_echo_msg_error_str='E'
" let g:ale_echo_msg_warning_str='W'
" let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
" let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
" let g:ale_fixers={'python': ['black']}
"
" ncm2 
" autocmd BufEnter * call ncm2#enable_for_buffer()      " enable ncm2 for all buffers
" set completeopt=noinsert,menuone,noselect             " IMPORTANT: :help Ncm2PopupOpen for more information
" let g:python3_host_prog='/usr/bin/python3'            " ncm2-jedi
"
" " gitgutter
" let g:gitgutter_async=0
"
