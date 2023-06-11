local nvim_lsp = require('lspconfig')
local null_ls = require("null-ls")

function on_attach(client, bufnr)

    local function map(key, cmd)
        local opts = {
            noremap = true,
            silent = false
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

    if client.name == 'null-ls' then
        map('<F5>', 'vim.lsp.buf.formatting_seq_sync()')
        client.resolved_capabilities.document_formatting = true
    else
        client.resolved_capabilities.document_formatting = false
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.eslint.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx",
                 "vue"}
}

nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
}

nvim_lsp.emmet_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {'css', 'html'}
}

nvim_lsp.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {'html'},
    cmd = {"vscode-html-language-server", "--stdio"}
}

nvim_lsp.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {"css", "scss", "less"},
    cmd = {"vscode-css-language-server", "--stdio"}
}

nvim_lsp.volar.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {'vue'},
    init_options = {
        typescript = {
            serverPath = '/usr/lib/node_modules/typescript/lib/tsserverlibrary.js'
        }
    }
}

null_ls.setup({
    on_attach = on_attach,
    sources = {null_ls.builtins.formatting.prettier}
})
