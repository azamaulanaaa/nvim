local M = {
	"akinsho/git-conflict.nvim",
	version = "*",
}

M.opts = function(_, opts)
	opts.default_mappings = false

	return opts
end

return M
