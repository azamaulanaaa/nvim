return {
	'neovim/nvim-lspconfig',
	requires = {
		{ 'nvim-lua/completion-nvim' },
	},
	config = function()

		-- LSP server
		local servers = {
			gopls = {
				cmd = {'gopls', '-remote=auto'},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					},
				}, 
			tsserver = {}, 
			pyright = {},
		}

		-- LSP on attach
		local on_attach = function(client, bufnr)

			-- Enable completion
			require('completion').on_attach(client, bufnr)

			-- Keybindings
			local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
			local default_opts = { noremap = true, silent = true }
			local expr_opts = { noremap = true, expr = true }

			buf_set_keymap('n', 'gd', vim.lsp.buf.definition, default_opts)
			buf_set_keymap('n', 'gD', vim.lsp.buf.declaration, default_opts)
			buf_set_keymap('n', 'gr', vim.lsp.buf.reference, default_opts)
			buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, default_opts)
			buf_set_keymap('n', 'K', vim.lsp.buf.hover, default_opts)
			buf_set_keymap('n', '<c-k>', vim.lsp.buf.signature_help, default_opts)
			buf_set_keymap('n', '[d', vim.lsp.diagnostic.goto_prev, default_opts)
			buf_set_keymap('n', ']d', vim.lsp.diagnostic.goto_next, default_opts)
			buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, default_opts)
			buf_set_keymap('i', '<tab>', "pumvisible() ? '<c-n>' : '<tab>'", expr_opts)
			buf_set_keymap('i', '<s-tab>', "pumvisible() ? '<c-p>' : '<s-tab>'", expr_opts)
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

		-- Completion menu
		vim.o.completeopt = 'menuone,noinsert,noselect'
		vim.o.shortmess = vim.o.shortmess .. 'c'

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
