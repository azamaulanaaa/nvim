local M = {
	"EdenEast/nightfox.nvim",
	lazy = false,
}

M.opts = function(_, opts)
	return opts
end

M.config = function(_, opts)
	require("nightfox").setup(opts)

	vim.opt.background = "dark"
	vim.cmd.colorscheme("carbonfox")
end

return M
