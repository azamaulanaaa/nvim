local M = { "mason-org/mason.nvim" }

M.cmd = function(_, _cmd)
	return { "Mason", "MasonInstall", "MasonUpdate" }
end

M.opts = function(_, opts)
	return opts
end

return M
