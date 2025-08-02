local M = { "mason-org/mason.nvim" }

M.event = function(_, events)
  table.insert(events, "BufReadPost")
  table.insert(events, "BufNewFile")

  return events
end

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
