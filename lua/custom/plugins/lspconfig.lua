local M = { "neovim/nvim-lspconfig" }

M.opts = function(_, opts)
	-- lua
	vim.lsp.enable("lua_ls")
	-- rust
	vim.lsp.enable("rust_analyzer")
	-- javascript, typescript, javascriptreact, typescriptreact
	vim.lsp.enable("denols")
	vim.lsp.enable("ts_ls")
	-- json
	vim.lsp.enable("jsonls")
	-- toml
	vim.lsp.enable("taplo")
	-- python
	vim.lsp.enable("pyrefly")
	-- protobuf
	vim.lsp.enable("buf_ls")
	-- composefile and docker
	vim.lsp.enable("docker_compose_language_service")
	vim.lsp.enable("docker_language_server")
	-- tailwindcss
	vim.lsp.enable("tailwindcss")

	return opts
end

return M
