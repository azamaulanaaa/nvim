local M = {"nvim-treesitter/nvim-treesitter"}

M.event = { "BufReadPost", "BufNewFile" }

M.cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" }

M.build = ":TSUpdate"

M.opts = function()
  return {
    ensure_installed = { "lua", "vim", "vimdoc" },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
  }
end

M.config = function(_, opts)
  require("nvim-treesitter.configs").setup(opts)
end

return M
