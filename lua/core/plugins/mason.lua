local M = { "mason-org/mason.nvim" }

M.cmd = function(_, cmds)
  table.insert(cmds, "Mason")
  table.insert(cmds, "MasonInstall")
  table.insert(cmds, "MasonUpdate")

  return cmds
end

M.opts = function(_, opts)
  return opts
end

return M
