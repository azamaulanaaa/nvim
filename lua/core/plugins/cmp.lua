local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    { "windwp/nvim-autopairs", config = true },
  }
}

M.event = function(_, events)
  table.insert(events, "InsertEnter")

  return events
end

M.opts = function(_, opts)
  opts.completion = opts.completion or {}
  opts.completion.completeopt = "menu,menuone"

  opts.snippet = opts.snippet or {}
  opts.snippet.expand = function(args)
    require("luasnip").lsp_expand(args.body)
  end

  opts.sources = opts.sources or {}
  table.insert(opts.sources, { name = "nvim_lsp" })
  table.insert(opts.sources, { name = "buffer" })
  table.insert(opts.sources, { name = "path" })
  table.insert(opts.sources, { name = "luasnip" })

  return opts
end

return M
