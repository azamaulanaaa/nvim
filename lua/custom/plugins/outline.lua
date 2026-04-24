local M = {
  "hedyhli/outline.nvim",
  lazy = true,
}

M.cmd = function(_, cmd)
  table.insert(cmd, "Outline")
end

M.opts = function(_, opts)
  opts.outline_window = opts.outline_window or {}
  opts.outline_window.focus_on_open = false
end

return M
