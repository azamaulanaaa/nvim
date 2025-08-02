local M = { "stevearc/conform.nvim" }

M.opts = function(_, opts)
	opts.formatters_by_ft = opts.formatters_by_ft or {}
	opts.formatters_by_ft.lua = { "stylua" }
	opts.formatters_by_ft.rust = { "rustfmt" }

	return opts
end

return M
