local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
require('lspkind').init()

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=')
vim.cmd('sign define LspDiagnosticsSignWarning text=')
vim.cmd('sign define LspDiagnosticsSignInformation text=')
vim.cmd('sign define LspDiagnosticsSignHint text=')
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

local on_attach = function(client, bufnr)

    -- require('completion').on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    map('n', 'gD',    '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'gd',    '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'K',     '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', 'gi',    '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '[d',    '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d',    '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    map('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    map('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    map('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    map('n', '<leader>lt',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<leader>lrf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map('n', '<leader>ld',  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    map('n', '<leader>ll',  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red gui=underline
        hi LspReferenceText cterm=bold ctermbg=red gui=underline
        hi LspReferenceWrite cterm=bold ctermbg=red gui=underline
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end


-- language server setups
local clangd_capabilities = capabilities;
clangd_capabilities.textDocument.semanticHighlighting = true;
require('lspconfig').clangd.setup({
    cmd = {
        'clangd',
        '--background-index',
        '--header-insertion=iwyu',
        '--clang-tidy',
        '--all-scopes-completion',
        '--completion-style=detailed',
        '--suggest-missing-includes'
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    capabilities = clangd_capabilities,
    on_attach = on_attach,
})


-- lua language server
local sumneko_root_path = '/usr/share/lua-language-server'
local sumneko_binary = "/usr/bin/lua-language-server"
require('lspconfig').sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        }
    },
    capabilities = capabilities;
    on_attach = on_attach;
})
require'lspconfig'.jsonls.setup{
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
require'lspconfig'.yamlls.setup{
}
require'lspconfig'.vimls.setup{
}
require('lspconfig').pyright.setup({
    capabilities = clangd_capabilities,
    on_attach = on_attach,
})
