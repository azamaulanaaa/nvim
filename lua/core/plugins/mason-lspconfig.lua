local M = {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
}

M.event = function(_, events)
  table.insert(events, "BufReadPost")
  table.insert(events, "BufNewFile")

  return events
end

M.opts = function(_, opts)
  return opts
end

return M
