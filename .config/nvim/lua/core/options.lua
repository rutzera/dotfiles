-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g     -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                               -- Enable mouse support
opt.clipboard = 'unnamedplus'                 -- Copy/paste to system clipboard
opt.swapfile = false                          -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true          -- Show line number
opt.relativenumber = false -- Show line number
opt.showmatch = true       -- Highlight matching parenthesis
opt.foldmethod = 'marker'  -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80'     -- Line lenght marker at 80 columns
opt.splitright = true      -- Vertical split to the right
opt.splitbelow = true      -- Horizontal split to the bottom
opt.ignorecase = true      -- Ignore case letters when search
opt.smartcase = true       -- Ignore lowercase for the whole pattern
opt.linebreak = true       -- Wrap on word boundary
opt.termguicolors = true   -- Enable 24-bit RGB colors
opt.laststatus = 3         -- Set global statusline
opt.wrap = false           -- display lines as one long line
opt.scrolloff = 10         -- keeps cursor 10 lines above top/end

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 4     -- Shift 4 spaces when tab
opt.tabstop = 4        -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true       -- Enable background buffers
opt.history = 100       -- Remember N lines in history
opt.lazyredraw = true   -- Faster scrolling
opt.synmaxcol = 240     -- Max column for syntax highlight
opt.updatetime = 250    -- ms to wait for trigger an event
opt.timeoutlen = 300    -- time to wait for a mapped sequence to complete (in milliseconds)
opt.writebackup = false -- Disable making a backup before overwriting a file

-----------------------------------------------------------
-- Globals
-----------------------------------------------------------
g.autoformat_enabled = true         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
g.status_diagnostics_enabled = true -- enable diagnostics in statusline
g.lsp_handlers_enabled = true       -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
g.diagnostics_enabled = true        -- enable diagnostics at start
g.highlighturl_enabled = true       -- highlight URLs by default
