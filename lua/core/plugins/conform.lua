local M = {"stevearc/conform.nvim"}

M.event = { "BufWritePre" }

M.cmd = { "ConformInfo" }

M.opts = function()
  return {
    formatters_by_ft = {
      lua = { "stylua" },
      ["_"] = { "trim_whitespace" },
    },
    format_on_save = { timeout_ms = 3000, lsp_format = "fallback" },
  }
end

return M
