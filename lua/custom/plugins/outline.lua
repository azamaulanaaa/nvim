local M = {
  "hedyhli/outline.nvim",
  lazy = true,
}

M.cmd = function(_, cmd)
  table.insert(cmd, "Outline")
end

M.opts = function(_, opts)
  opts.outline_window = opts.outline_window or {}
  opts.outline_window.focus_on_open = false
end

M.config = function(_, opts)
  require("outline").setup(opts)

  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      if vim.bo.filetype == "Outline" and vim.fn.winnr('$') == 1 then
        vim.cmd("q")
      end
    end,
  })
end

return M
