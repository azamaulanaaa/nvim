local M = {
  "ibhagwan/fzf-lua",
}

M.opts = function(_, opts)
  opts[0] = opts[0] or {}
  table.insert(opts[0], "border-fused")

  opts.defaults = opts.defaults or {}
  opts.defaults.git_icons = false
  opts.defaults.file_icons = false

  return opts
end

return M
