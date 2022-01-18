local execute = vim.api.nvim_command
local fn = vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " ..
                install_path)
    execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

packer.init {
    -- compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.vim',
    compile_path = require("packer.util").join_paths(vim.fn.stdpath('config'),
                                                     'plugin',
                                                     'packer_compiled.vim'),
    git = {clone_timeout = 300},
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end
    }
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {"ray-x/lsp_signature.nvim",}

    -- Autocomplete
    use {"hrsh7th/nvim-compe"}
    use {"windwp/nvim-autopairs"}

    --Snippets
    use { 'hrsh7th/vim-vsnip' }
    use { 'cstrap/python-snippets' }
    use { 'ylcnfrht/vscode-python-snippet-pack' }

    -- Telescope
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-telescope/telescope.nvim'}

    -- fhich-key pop-up
    use {
        "folke/which-key.nvim",
        config = function()
          require("which-key").setup {} end
    }

    -- color scheme and icons
    use {'sainnhe/gruvbox-material'}
    use {'kyazdani42/nvim-web-devicons'}
    -- statusline
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require 'config.statusline' end
    }

    -- IDE
    use{'scrooloose/nerdtree'}
    use{'jalvesaq/Nvim-R'}
    use{'tpope/vim-commentary'}
    use "lukas-reineke/indent-blankline.nvim"

end)
