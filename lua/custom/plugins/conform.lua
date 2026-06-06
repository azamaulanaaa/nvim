local M = { "stevearc/conform.nvim" }

M.opts = function(_, opts)
	opts.formatters_by_ft = opts.formatters_by_ft or {}

	opts.formatters_by_ft.lua = { "stylua" }
	opts.formatters_by_ft.rust = { "rustfmt" }
	opts.formatters_by_ft.toml = { "taplo" }
	opts.formatters_by_ft.python = { "ruff_format" }
	opts.formatters_by_ft.proto = { "buf" }

	local web_fallback = { "deno_fmt", "prettierd", "prettier", stop_after_first = true }
	opts.formatters_by_ft.javascript = web_fallback
	opts.formatters_by_ft.typescript = web_fallback
	opts.formatters_by_ft.javascriptreact = web_fallback
	opts.formatters_by_ft.typescriptreact = web_fallback
	opts.formatters_by_ft.json = web_fallback
	opts.formatters_by_ft.markdown = web_fallback
	opts.formatters_by_ft.css = web_fallback
	opts.formatters_by_ft.html = web_fallback
	opts.formatters_by_ft.yaml = web_fallback

	return opts
end

return M
