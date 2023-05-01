-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    return
end

-- Start setup
lazy.setup({
    -- plugin management
    {
        'nvim-lua/plenary.nvim'
    },
    -- colorscheme
    {
        'navarasu/onedark.nvim'
    },
    -- File explorer
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    -- bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    -- indent line
    {
        "lukas-reineke/indent-blankline.nvim"
    },

    -- which key
    {
        "folke/which-key.nvim",
    },

    -- tree sitter
    {
        "nvim-treesitter/nvim-treesitter"
    },
    -- comment
    {
        'numToStr/Comment.nvim'
    },
    -- vim surround
    {
        'tpope/vim-surround'
    },
    -- auto-pairs
    {
        'LunarWatcher/auto-pairs'
    },
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- toggleterm
    {
        'akinsho/toggleterm.nvim', version = "*", config = true
    },
    -- git
    {
        'tpope/vim-fugitive'
    },
    {
        'lewis6991/gitsigns.nvim'
    },
    {
        'folke/todo-comments.nvim',
        dependencies = "nvim-lua/plenary.nvim"
    },
    -- Copilot
    {
        'zbirenbaum/copilot.lua'
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
})
