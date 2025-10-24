local M = { "stevearc/conform.nvim" }

M.opts = function(_, opts)
	opts.formatters_by_ft = opts.formatters_by_ft or {}
	opts.formatters_by_ft.lua = { "stylua" }
	opts.formatters_by_ft.rust = { "rustfmt" }
	opts.formatters_by_ft.javascript = { "deno_fmt" }
	opts.formatters_by_ft.typescript = { "deno_fmt" }
	opts.formatters_by_ft.javascriptreact = { "deno_fmt" }
	opts.formatters_by_ft.typescriptreact = { "deno_fmt" }
	opts.formatters_by_ft.json = { "deno_fmt" }
	opts.formatters_by_ft.markdown = { "deno_fmt" }
	opts.formatters_by_ft.toml = { "taplo" }

	return opts
end

return M
