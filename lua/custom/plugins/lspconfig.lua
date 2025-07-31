local M = { "neovim/nvim-lspconfig" }

M.opts = function(_, opts)
  vim.lsp.enable("rust_analyzer")

  return opts
end

return M
