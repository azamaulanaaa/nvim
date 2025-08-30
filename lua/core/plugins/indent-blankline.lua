local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
}

M.event = function(_, events)
	table.insert(events, "BufReadPost")
	table.insert(events, "BufNewFile")

	return events
end

M.opts = function(_, opts)
	return opts
end

return M
