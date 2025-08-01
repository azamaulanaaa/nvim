local M = { "lewis6991/gitsigns.nvim" }

M.opts = function(_, opts)
  opts.current_line_blame = true

  return opts
end

return M
