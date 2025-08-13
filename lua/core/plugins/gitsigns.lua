local M = {
	"lewis6991/gitsigns.nvim",
	version = "*",
}

M.event = function(_, events)
	table.insert(events, "BufReadPost")
	table.insert(events, "BufNewFile")

	return events
end

M.opts = function(_, opts)
	opts.current_line_blame = true

	return opts
end

return M
