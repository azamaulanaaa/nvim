local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

M.event = function(_, events)
	table.insert(events, "BufReadPost")
	table.insert(events, "BufNewFile")

	return events
end

M.cmd = function(_, cmds)
	table.insert(cmds, "TSInstall")
	table.insert(cmds, "TSBufEnable")
	table.insert(cmds, "TSBufDisable")
	table.insert(cmds, "TSModuleInfo")

	return cmds
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
