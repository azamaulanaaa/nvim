local M = { "MeanderingProgrammer/render-markdown.nvim" }

M.opts = function(_, opts)
	opts.completions = opts.completions or {}

	opts.completions.lsp = opts.completions.lsp or {}
	opts.completions.lsp.enabled = true

	opts.completions.blink = opts.completions.blink or {}
	opts.completions.blink.enabled = true

	return opts
end

return M
