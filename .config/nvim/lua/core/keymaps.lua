-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a space
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to jj
map('i', 'jj', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>nh', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')

-- Change split orientation
map('n', '<leader>sk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>sh', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- write, close, quit
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>c', ':bd<CR>')
map('n', '<leader>q', ':wq<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
-- terminal navigation
map('t', '<C-h>', '<c-\\><c-n><c-w>h')
map('t', '<C-j>', '<c-\\><c-n><c-w>j')
map('t', '<C-k>', '<c-\\><c-n><c-w>k')
map('t', '<C-l>', '<c-\\><c-n><c-w>l')
-- map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
-- map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>') -- open/close
map('n', '<leader>o', ':NvimTreeFocus<CR>')  -- open and focus
-- map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
-- map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- bufferline
map('n', '<S-h>', ':bprevious<CR>')
map('n', '<S-l>', ':bnext<CR>')

-- Telescope
-- vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
map('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
map('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

-- lsp
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("v", "<C-k>", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>')
map("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>')
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- Copilot
-- vim.api.nvim_set_keymap('i', '<C-/>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
