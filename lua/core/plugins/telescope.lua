local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
}

M.opts = function(_, opts)
	opts.extensions = opts.extensions or {}

	opts.extensions.fzf = opts.extensions.fzf or {}
	opts.extensions.fzf.fuzzy = true
	opts.extensions.fzf.override_generic_sorter = true
	opts.extensions.fzf.override_file_sorter = true
	opts.extensions.fzf.case_mode = "smart_case"

	return opts
end

M.config = function(_, opts)
	require("telescope").setup(opts)

	require("telescope").load_extension("fzf")
end

return M
