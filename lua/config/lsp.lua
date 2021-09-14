return {
	'neovim/nvim-lspconfig',
	opt = true,
	ft = { 
		'go',
		'javascript',
		'javascriptreact',
        'rust',
		'typescript',
		'typescriptreact',
		'python',
	},
	config = function()

		-- LSP server
		local servers = {
			gopls = {
				cmd = {'gopls'},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					},
				}, 
			tsserver = {}, 
			pyright = {},
            rust_analyzer = {},
		}

		-- LSP on attach
		local on_attach = function(client, bufnr)

			-- Keybindings
			local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

			local default_opts = { noremap = true, silent = true }
			local expr_opts = { noremap = true, expr = true }

			buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', default_opts)
			buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', default_opts)
			buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.reference()<cr>', default_opts)
			buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', default_opts)
			buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', default_opts)
			buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', default_opts)
			buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', default_opts)
			buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', default_opts)
			buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', default_opts)
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
