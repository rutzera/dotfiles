local utils = require('utils')

vim.g.mapleader = ' '
--vim.g.maplocalleader = ','

-- in insert mode ii = Esc
utils.map('i', 'ii', '<Esc>')
-- faster buffer saving
utils.map('n', '<leader>ss', ':w<cr>')
-- Shortcut for reloading init.lua
utils.map('n', '<Leader>sp', ':luafile $HOME/.config/nvim/init.lua<cr>', { silent = true })

-- NERDtree
utils.map('n', '<leader>n', ':NERDTreeFocus<CR>', {noremap =true})
utils.map('n', '<C-n>', ':NERDTree<CR>', {noremap =true})
utils.map('n', '<C-t>', ':NERDTreeToggle<CR>', {noremap =true})
utils.map('n', '<C-f>', ':NERDTreeFind<CR>', {noremap =true})


-- better window movement
utils.map('n', '<C-j>', '<C-w>j', {silent = true})
utils.map('n', '<C-h>', '<C-w>h', {silent = true})
utils.map('n', '<C-k>', '<C-w>k', {silent = true})
utils.map('n', '<C-l>', '<C-w>l', {silent = true})

-- resize with arrows
utils.map('n', '<C-Up>', ':resize -2<CR>', {silent = true})
utils.map('n', '<C-Down>', ':resize +2<CR>', {silent = true})
utils.map('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
utils.map('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- change 2 split windows from vert to horiz / viseversa
utils.map('n', '<Leader>th', '<C-w>t<C-w>H')
utils.map('n', '<Leader>tk', '<C-w>t<C-w>K')

-- cd to current directory
utils.map('n', '<leader>cd',':cd %:p:h<CR>:pwd<CR>')

-- better indenting
utils.map('v', '<', '<gv', {noremap = true, silent = true})
utils.map('v', '>', '>gv', {noremap = true, silent = true})

-- Tab switch buffer
utils.map('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
utils.map('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
utils.map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
utils.map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- insert empty line in normal mode
utils.map('n', '<leader>o', 'o<Esc>')
utils.map('n', '<leader>O', 'O<Esc>')

-- clear highlighting
utils.map('n', '<leader>nh', ':let @/ = ""<cr>', { silent = true })
