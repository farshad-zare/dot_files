require('keybindings')
require('plugins')
require('configs')

local nvim_lsp = require('lspconfig')
local servers = {'emmet_ls', 'eslint', 'cssls', 'vuels', 'html', 'bashls', 'null-ls'}

function on_attach(client, bufnr)

    local function map(key, cmd)
        local opts = {
            noremap = true,
            silent = true
        }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', key, '<cmd>lua ' .. cmd .. '<CR>', opts)
    end

    map('K', 'vim.lsp.buf.hover()')
    map('gd', 'vim.lsp.buf.definition()')
    map('gD', 'vim.lsp.buf.declaration()')
    map('gi', 'vim.lsp.buf.implementation()')
    map('gr', 'vim.lsp.buf.references()')
    map('<space>ca', 'vim.lsp.buf.code_action()')
    map('<space>gh', 'vim.lsp.buf.signature_help()')
    map('<space>rn', 'vim.lsp.buf.rename()')
    map('[d', 'vim.diagnostic.goto_prev()')
    map(']d', 'vim.diagnostic.goto_next()')
    map('<space>df', 'vim.diagnostic.open_float()')

    if client.name ~= 'null-ls' then
        client.resolved_capabilities.document_formatting = false
    end
end

for _, lsp in ipairs(servers) do
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach
    }

end

