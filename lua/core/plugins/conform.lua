local M = { "stevearc/conform.nvim" }

M.event = function(_, events)
  table.insert(events, "BufWritePre")

  return events
end

M.cmd = function(_, cmds)
  table.insert(cmds, "ConformInfo")

  return cmds
end

M.opts = function(_, opts)
  opts.format_on_save = opts.format_on_save or {}
  opts.format_on_save.timeout_ms = 3000
  opts.format_on_save.lsp_format = "fallback"

  return opts
end

return M
