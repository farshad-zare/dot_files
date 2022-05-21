require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    autopairs = {
        enable = true
    },
    rainbow = {
        enable = true
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true
    }
}

-- add folding 
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
