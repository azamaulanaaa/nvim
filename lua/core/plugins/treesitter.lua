local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

M.event = function(_, _events)
	return { "BufReadPost", "BufNewFile" }
end

M.cmd = function(_, _cmds)
	return { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" }
end

M.opts = function(_, opts)
	opts.ensure_installed = { "lua", "vim", "vimdoc" }
	opts.use_languagetree = true
	opts.auto_install = true

	opts.highlight = opts.highlight or {}
	opts.highlight.enable = true

	opts.indent = opts.indent or {}
	opts.indent.enable = true

	opts.incremental_selection = opts.incremental_selection or {}
	opts.incremental_selection.enable = true

	return opts
end

return M
