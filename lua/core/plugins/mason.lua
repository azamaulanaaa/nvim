local M = {"williamboman/mason.nvim"}

M.cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" }

M.opts = function()
  return {
    ensure_installed = { "lua-language-server" },
  }
end

M.config = function(_, opts)
  require("mason").setup(opts)
end

return M
