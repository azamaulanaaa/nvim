local M = {
  "folke/lazydev.nvim",
  ft = "lua",
}

M.opts = function(_, opts)
  opts.library = opts.library or {}
  table.insert(opts.library, {
    path = "${3rd}/luv/library",
    words = { "vim%.uv" }
  })

  return opts
end

return M
