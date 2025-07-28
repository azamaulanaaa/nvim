local M = { "stevearc/conform.nvim" }

M.event = function(_, _events)
	return { "BufWritePre" }
end

M.cmd = function(_, cmds)
	return { "ConformInfo" }
end

M.opts = function(_, opts)
	opts.formatters_by_ft = opts.formatters_by_ft or {}

	opts.lua = opts.lua or {}
	opts.lua = vim.tbl_deep_extend("force", { "stylua" }, opts.lua)

	opts.format_on_save = opts.format_on_save or {}
	opts.format_on_save.timeout_ms = 3000
	opts.format_on_save.lsp_format = "fallback"

	return opts
end

return M
