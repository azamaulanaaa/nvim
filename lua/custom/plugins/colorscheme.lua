local M = {
	"EdenEast/nightfox.nvim",
	lazy = false,
}

M.opts = function(_, opts)
	opts.options = opts.options or {}
	opts.options.module_default = false

	opts.options.modules = opts.options.modules or {}
	opts.options.modules.cmp = true
	opts.options.modules.diagnostic = true
	opts.options.modules.gitsigns = true
	opts.options.modules["indent_blanklines"] = true
	opts.options.modules["lazy.nvim"] = true
	opts.options.modules.leap = true
	opts.options.modules.native_lsp = true
	opts.options.modules.nvimtree = true
	opts.options.modules.treesitter = true
	opts.options.modules.whichkey = true
end

M.opts = function(_, opts)
	return opts
end

M.config = function(_, opts)
	require("nightfox").setup(opts)

	vim.opt.background = "dark"
	vim.cmd.colorscheme("carbonfox")
end

return M
