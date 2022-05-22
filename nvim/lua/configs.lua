local vim = vim
local set = vim.opt -- global options

set.undofile = true
set.undodir = vim.fn.stdpath("config") .. "/undo"
set.clipboard = set.clipboard + "unnamedplus" -- copy & paste
set.wrap = false -- don't automatically wrap on load
set.showmatch = true -- show the matching part of the pair for [] {} and ()
set.cursorline = true -- highlight current line
set.number = true -- show line numbers
set.relativenumber = true -- show relative line number
set.incsearch = true -- incremental search
set.hlsearch = true -- highlighted search results
set.ignorecase = true -- ignore case sensetive while searching
set.smartcase = true
set.scrolloff = 1 -- when scrolling, keep cursor 1 lines away from screen border
set.sidescrolloff = 2 -- keep 30 columns visible left and right of the cursor at all times
set.backspace = 'indent,start,eol' -- make backspace behave like normal again
set.mouse = "a" -- turn on mouse interaction
set.updatetime = 500 -- CursorHold interval
set.expandtab = true
set.softtabstop = 2
set.shiftwidth = 2 -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
set.tabstop = 2 -- spaces per tab
set.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
set.autoindent = true -- maintain indent of current line
set.shiftround = true
set.splitbelow = true -- open horizontal splits below current window
set.splitright = true -- open vertical splits to the right of the current window
set.laststatus = 2 -- always show status line
-- ------------------------add border to diagnostics popup-----------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------
-- wrap open_float to inspect diagnostics and use the severity color for border
-- https://neovim.discourse.group/t/lsp-diagnostics-how-and-where-to-retrieve-severity-level-to-customise-border-color/1679
vim.diagnostic.open_float = (function(orig)
    return function(bufnr, opts)
        local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
        local opts = opts or {}
        -- A more robust solution would check the "scope" value in `opts` to
        -- determine where to get diagnostics from, but if you're only using
        -- this for your own purposes you can make it as simple as you like
        local diagnostics = vim.diagnostic.get(opts.bufnr or 0, {
            lnum = lnum
        })
        local max_severity = vim.diagnostic.severity.HINT
        for _, d in ipairs(diagnostics) do
            -- Equality is "less than" based on how the severities are encoded
            if d.severity < max_severity then
                max_severity = d.severity
            end
        end
        local border_color = ({
            [vim.diagnostic.severity.HINT] = "DiagnosticHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
            [vim.diagnostic.severity.ERROR] = "DiagnosticError"
        })[max_severity]
        opts.border = {{"╔", border_color}, {"═", border_color}, {"╗", border_color}, {"║", border_color},
                       {"╝", border_color}, {"═", border_color}, {"╚", border_color}, {"║", border_color}}
        orig(bufnr, opts)
    end
end)(vim.diagnostic.open_float)

-- Show line diagnostics in floating popup on hover, except insert mode (CursorHoldI)
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]

-- Show source in diagnostics, not inline but as a floating popup
vim.diagnostic.config({
    virtual_text = false,
    float = {
        source = "always" -- Or "if_many"
    }
})
-- -----------------Highlight line number instead of having icons in sign column-------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------
vim.cmd [[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

