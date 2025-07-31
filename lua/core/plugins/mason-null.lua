local M = {
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
}

M.opts = function(_, opts)
	opts.handlers = {}

	return opts
end

return M
