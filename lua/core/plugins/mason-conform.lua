local M = {
  "zapling/mason-conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "stevearc/conform.nvim",
  },
}

M.event = function(_, events)
  table.insert(events, "BufReadPost")
  table.insert(events, "BufNewFile")

  return events
end

return M
