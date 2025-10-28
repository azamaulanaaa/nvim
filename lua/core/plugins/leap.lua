local M = {
	"ggandor/leap.nvim",
	dependencies = {
		"tpope/vim-repeat",
	},
}

M.event = function(_, events)
	table.insert(events, "BufReadPost")
	table.insert(events, "BufNewFile")

	return events
end

M.config = function(_, configs)
	-- require("leap").add_default_mappings()
end

return M
