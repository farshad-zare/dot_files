function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true
    }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- open/close floating file manager --
map("n", "<F3>", ":Neotree position=float toggle=true<CR>", {
    noremap = true,
    silent = true
})
-- open floating terminal --
map("n", "<F4>", ":FloatermToggle title=terminal<CR>", {
    noremap = true,
    silent = true
})
-- exit terminal --
map("t", "<F4>", "exit<CR>", {
    noremap = true,
    silent = true
})

