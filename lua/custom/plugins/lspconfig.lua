local M = { "neovim/nvim-lspconfig" }

M.opts = function(_, opts)
	-- lua
	vim.lsp.enable("lua_ls")
	-- rust
	vim.lsp.enable("rust_analyzer")
	-- javascript, typescript, javascriptreact, typescriptreact
	vim.lsp.enable("denols")

	return opts
end

return M
