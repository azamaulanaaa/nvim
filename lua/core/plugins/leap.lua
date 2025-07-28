local M = {
	"ggandor/leap.nvim",
	dependencies = {
		"tpope/vim-repeat",
	},
}

M.config = function(_, configs)
	require("leap").add_default_mappings()
end

return M
