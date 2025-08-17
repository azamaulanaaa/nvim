local M = { "neovim/nvim-lspconfig" }

M.opts = function(_, opts)
	-- lua
	vim.lsp.enable("lua_ls")
	-- rust
	vim.lsp.enable("rust_analyzer")
	-- javascript, typescript, javascriptreact, typescriptreact
	vim.lsp.enable("denols")
	-- json
	vim.lsp.enable("jsonls")
	-- toml
	vim.lsp.enable("taplo")

	return opts
end

return M
