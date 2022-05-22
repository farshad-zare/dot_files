local execute = vim.api.nvim_command
local cmd = vim.cmd -- execute Vim commands
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end
cmd('packadd packer.nvim')

local packer = require 'packer'
local util = require 'packer.util'

packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
return packer.startup({function(use)

    use "wbthomason/packer.nvim"

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {"nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "MunifTanjim/nui.nvim"},
        config = [[ require('pluginsOpts/neotree') ]]
    }

    use {
        "projekt0n/github-nvim-theme",
        config = [[ require('pluginsOpts/theme') ]]
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[ require('pluginsOpts/treesitter') ]]
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[ require('pluginsOpts/bufferline') ]]
    }

    use {'neovim/nvim-lspconfig'}
    use {'williamboman/nvim-lsp-installer'}
    use {"jose-elias-alvarez/null-ls.nvim"}

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use {
        'hrsh7th/nvim-cmp',
        config = [[ require('pluginsOpts/nvimcmp') ]]
    }

    if packer_bootstrap then
        require("packer").sync()
    end

end})

