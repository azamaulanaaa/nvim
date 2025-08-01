local M = { "neovim/nvim-lspconfig" }

M.event = function(_, events)
  table.insert(events, "BufReadPost")
  table.insert(events, "BufNewFile")

  return events
end

M.config = function(_, opts) end

return M
