-----------------------------------------------------------
-- Neovim Settings
-----------------------------------------------------------
--> call this file from the main init.lua

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local utils = require('utils')
local cmd = vim.cmd                          -- execute vim commands
local exec = vim.api.nvim_exec               -- execute Vimscript
-- local fn = vim.fn                         -- call vim funciton
-- local g = vim.g                           -- global variables

local indent = 4

-----------------------------------------------------------
-- Settings
-----------------------------------------------------------
cmd 'syntax enable'                          -- enable syntax highlighting
cmd 'filetype plugin indent on'              -- needed for some plugins

-- colorscheme
utils.opt('o', 'termguicolors', true)
cmd 'colorscheme gruvbox-material'
utils.opt('o','background', 'dark')

-----------------------------------------------------------
-- Global options
-----------------------------------------------------------
utils.opt('o', 'encoding', 'UTF-8')
utils.opt('o', 'autochdir', true)
utils.opt('o', 'backup', false)
utils.opt('o', 'compatible', false)
utils.opt('o', 'mouse', 'a')                 -- enable mouse support
utils.opt('o', 'clipboard', 'unnamedplus')   -- copy/pase to system clipboard
---- better searching
utils.opt('o', 'ignorecase', true)           -- ignore case letters when search
utils.opt('o', 'smartcase', true)            -- ignore lowercase for the whole pattern
utils.opt('o', 'hlsearch', true)
utils.opt('o', 'incsearch', true)

utils.opt('o', 'showcmd', true)              -- show commands bottom right
utils.opt('o', 'showmatch', true)            -- highlight matching parenthesis
utils.opt('o', 'splitright', true)           -- vertical split to the right
utils.opt('o', 'splitbelow', true)           -- horizontal split to the bottom
utils.opt('o', 'inccommand', "split")        -- Also shows partial off-screen results in a preview window.

utils.opt('o', 'ttimeoutlen', 500)           -- Time in milliseconds to wait for a mapped sequence to complete.
-- TODO: needed if swapfile = false? --> in bufferoptions
utils.opt('o', 'updatetime', 300)            -- If this many milliseconds nothing is typed the swap file will be written to disk
utils.opt('o', 'undodir', '/home/adrian/.config/nvim/undodir')

utils.opt('o', 'hidden', true)-- enable background buffers
utils.opt('o', 'history', 100)               -- how many entries are stored
-- utils.opt('o', 'lazyredraw', true)        -- when set screen will not be redrawn while executing macros, registers and other commands that have not beend typed
utils.opt('o', 'cmdheight', 2)               -- Number of screen lines to use for the command-line.

-- settings for wildmenu (tabbing thourgh suggestion)
-- utils.opt('o', 'wildmode', 'longest,list')
cmd [[
set expandtab smarttab shiftround autoindent smartindent smartcase
set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
]]

-----------------------------------------------------------
-- Buffer Local Options
-----------------------------------------------------------
utils.opt('b', 'synmaxcol', 240)             -- Maximum column in which to search for syntax items
utils.opt('b', 'swapfile', false)
utils.opt('b', 'undofile', true)             -- save undofile, false = no saving
-- Tabs, indent
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'autoindent', true)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'shiftwidth', indent)

cmd [[set nowrap]]                           -- no line wrapping when line longer then window

-------------------------------------------------------------
---- Neovim UI
-------------------------------------------------------------
utils.opt('w', 'number', true)               -- show line number
utils.opt('w', 'relativenumber', true)       -- show relative line numbers
utils.opt('w', 'scrolloff', 10)              -- show lines below cursor
utils.opt('w', 'sidescrolloff', 5)
utils.opt('w', 'cursorline', true)           -- show cursorline
utils.opt('w', 'colorcolumn', '80')          -- line lenght marker at 80 columns
-- wo.foldmethod = 'marker'                  -- enable folding (default 'foldmarker')

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
  augroup end
]], false)

-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- remove line lenght marker for selected filetypes
cmd([[
  autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0
]])

-- 2 spaces for selected filetypes
cmd([[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]])

-- 8 spaces for Go files
cmd([[autocmd FileType go setlocal shiftwidth=8 tabstop=8]])

-- NERDtree
-- Exit Vim if NERDTree is the only window remaining in the only tab.
cmd([[autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])

------------------------------------
-- Auto format
-- vim.api.nvim_exec([[
-- augroup auto_fmt
--     autocmd!
--     autocmd BufWritePre *.py,*.lua try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
-- aug END
-- ]], false)
--
-- vim.api.nvim_exec([[
-- augroup auto_spellcheck
--     autocmd!
--     autocmd BufNewFile,BufRead *.md setlocal spell
--     autocmd BufNewFile,BufRead *.org setfiletype markdown
--     autocmd BufNewFile,BufRead *.org setlocal spell
-- augroup END
-- ]], false)
--
-- vim.api.nvim_exec([[
-- augroup auto_term
--     autocmd!
--     autocmd TermOpen * setlocal nonumber norelativenumber
--     autocmd TermOpen * startinsert
-- augroup END
-- ]], false)
--
-- vim.api.nvim_exec([[
--     fun! TrimWhitespace()
--         let l:save = winsaveview()
--         keeppatterns %s/\s\+$//e
--         call winrestview(l:save)
--     endfun
--
--     autocmd FileType go,rust,html,typescript,javascript,python autocmd BufWritePre <buffer> call TrimWhitespace()
--
-- ]], false)
