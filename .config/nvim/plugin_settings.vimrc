filetype plugin on
"Plugin Settings
""""""""""""""""""""""""""""""""""
colorscheme gruvbox
"enable lightline color line
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ]]},
      \ 'component': {
      \   'filename': '%F',},}

" coc-highlight - similar words
autocmd CursorHold * silent call CocActionAsync('highlight')

