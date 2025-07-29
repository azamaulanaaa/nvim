local M = {
	"nvim-lualine/lualine.nvim",
}

M.opts = function(_, opts)
	opts = {}

	opts.options = opts.options or {}
	opts.options.icons_enabled = false
	opts.options.theme = {}

	opts.options.component_separators = opts.options.component_separators or {}
	opts.options.component_separators.left = ""
	opts.options.component_separators.right = ""

	opts.options.section_separators = opts.options.section_separators or {}
	opts.options.section_separators.left = ""
	opts.options.section_separators.right = ""

	opts.sections = opts.sections or {}
	opts.sections.lualine_a = { "filename" }
	opts.sections.lualine_b = {}
	opts.sections.lualine_c = {}
	opts.sections.lualine_x = {}
	opts.sections.lualine_y = {}
	opts.sections.lualine_z = {
		{
			"branch",
			fmt = function(branch)
				if (not branch == nil) or branch == "" then
					return nil
				end

				return string.format("[%s]", branch)
			end,
		},
	}

	return opts
end

return M
