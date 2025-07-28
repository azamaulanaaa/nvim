local M = { "mason-org/mason.nvim" }

M.cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" }

M.opts = function(_, opts)
	return opts
end

return M
