return {
	'lukas-reineke/indent-blankline.nvim',
	config = function()
		local g = vim.g

		-- Enable indent line
		g.indentLine_enabled = 1

		-- Exclude
		g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
		g.indent_blankline_buftype_exclude = { "terminal" }

		-- Look
		g.indent_blankline_char = "▏"
		g.indent_blankline_show_trailing_blankline_indent = false
	end,
}
