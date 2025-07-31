local M = {
	"nvim-tree/nvim-tree.lua",
}

M.cmd = function(_, cmds)
	table.insert(cmds, "NvimTreeToggle")

	return cmds
end

M.opts = function(_, opts)
	local HEIGHT_RATIO = 0.8 -- You can change this
	local WIDTH_RATIO = 0.5 -- You can change this too

	opts.disable_netrw = true
	opts.hijack_cursor = true
	opts.sync_root_with_cwd = true

	opts.view = opts.view or {}
	opts.view.width = function()
		return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
	end

	opts.view.float = opts.view.float or {}
	opts.view.float.enable = true
	opts.view.float.open_win_config = function()
		local screen_w = vim.opt.columns:get()
		local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
		local window_w = screen_w * WIDTH_RATIO
		local window_h = screen_h * HEIGHT_RATIO
		local window_w_int = math.floor(window_w)
		local window_h_int = math.floor(window_h)
		local center_x = (screen_w - window_w) / 2
		local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
		return {
			border = "single",
			relative = "editor",
			row = center_y,
			col = center_x,
			width = window_w_int,
			height = window_h_int,
		}
	end

	opts.renderer = opts.renderer or {}
	opts.renderer.indent_markers = opts.renderer.indent_markers or {}
	opts.renderer.icons = opts.renderer.icons or {}

	opts.renderer.indent_markers.enable = true

	opts.renderer.icons.glyphs = opts.renderer.icons.glyphs or {}
	opts.renderer.icons.glyphs.default = " "

	opts.renderer.icons.glyphs.folder = opts.renderer.icons.glyphs.folder or {}
	opts.renderer.icons.glyphs.folder.default = "+"
	opts.renderer.icons.glyphs.folder.open = "-"
	opts.renderer.icons.glyphs.folder.empty = "+"
	opts.renderer.icons.glyphs.folder.empty_open = "-"

	opts.renderer.icons.show = opts.renderer.icons.show or {}
	opts.renderer.icons.show.folder_arrow = false
	opts.renderer.icons.show.git = false
	opts.renderer.icons.show.modified = false
	opts.renderer.icons.show.hidden = false
	opts.renderer.icons.show.diagnostics = false
	opts.renderer.icons.show.bookmarks = false

	return opts
end

M.config = function(_, opts)
	require("nvim-tree").setup(opts)

	-- NOTE: fix file icon color
	vim.cmd.highlight({ "link", "NvimTreeFileIcon", "NONE" })
end

return M
