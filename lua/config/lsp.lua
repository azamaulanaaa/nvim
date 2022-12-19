return {
    'neovim/nvim-lspconfig',
    config = function()

        -- LSP server
        local servers = {
            -- golang
            gopls = {
                cmd = {'gopls'},
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    },
                }, 
            -- javascript & typescript (includes react)
            tsserver = {}, 
            -- deno
            denols = {}, 
            -- python
            pyright = {},
            -- rust
            rust_analyzer = {},
        }

        local default_opts = { noremap = true, silent = true }

        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, default_opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, default_opts)

        -- LSP on attach
        local on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Keybindings
            local default_opts = { noremap = true, silent = true, buffer=bufnr }

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, default_opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, default_opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, default_opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, default_opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, default_opts)
            vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, default_opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, default_opts)
        end

        -- Default LSP config
        local lsp_default_config = {
            on_attach = on_attach,
        }

        -- Load LSP config
        local lsp_config = require('lspconfig')
        for server, config in pairs(servers) do
            lsp_config[server].setup(vim.tbl_deep_extend('force', lsp_default_config, config))
        end

        -- LSP diagnostics
        vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = false,
                signs = false,
                update_in_insert = true,
            }
        )

        -- Completion icons
        vim.lsp.protocol.CompletionItemKind = {
            ' ', -- Text
            ' ', -- Method
            ' ', -- Function
            ' ', -- Constructor
            ' ', -- Field
            ' ', -- Variable
            ' ', -- Class
            'ﰮ ', -- Interface
            ' ', -- Module
            ' ', -- Property
            ' ', -- Unit
            ' ', -- Value
            ' ', -- Enum
            ' ', -- Keyword
            '﬌ ', -- Snippet
            ' ', -- Color
            ' ', -- File
            ' ', -- Reference
            ' ', -- Folder
            ' ', -- EnumMember
            ' ', -- Constant
            ' ', -- Struct
            ' ', -- Event
            'ﬦ ', -- Operator
            ' ', -- TypeParameter
        }
    end,
}
