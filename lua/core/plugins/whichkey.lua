local M = { "folke/which-key.nvim" }

M.event = function(_, events)
	table.insert(events, "VeryLazy")

	return events
end

M.cmd = function(_, cmd)
	table.insert(cmd, "WhichKey")

	return cmd
end

M.opts = function(_, opts)
	return opts
end

return M
