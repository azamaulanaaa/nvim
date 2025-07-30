local M = {
	"ibhagwan/fzf-lua",
}

M.opts = function(_, opts)
	opts = {
		{ "border-fused" },
		defaults = { git_icons = false, file_icons = false },
	}

	return opts
end

return M
