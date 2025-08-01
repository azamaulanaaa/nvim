local M = {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    { "windwp/nvim-autopairs", config = true },
  },
}

M.opts = function(_, opts)
  opts.completion = opts.completion or {}

  opts.completion.documentation = opts.completion.documentation or {}
  opts.completion.documentation.auto_show = true

  opts.fuzzy = opts.fuzzy or {}
  opts.fuzzy.implementation = "prefer_rust"

  opts.keymap = opts.keymap or {}
  opts.keymap.preset = "none"

  opts.keymap["<CR>"] = { "accept", "fallback" }
  opts.keymap["<Tab>"] = { "select_next" }
  opts.keymap["<S-Tab>"] = { "select_prev" }

  return opts
end

return M
