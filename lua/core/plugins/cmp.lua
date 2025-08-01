local M = {
  "saghen/blink.cmp",
  version = "1.*",
}

M.event = function(_, events)
  table.insert(events, "BufReadPost")
  table.insert(events, "BufNewFile")

  return events
end

M.opts = function(_, opts)
  opts.completion = opts.completion or {}

  opts.completion.menu = opts.completion.menu or {}
  opts.completion.menu.border = "none"

  opts.completion.documentation = opts.completion.documentation or {}
  opts.completion.documentation.auto_show = true

  opts.completion.documentation.window = opts.completion.documentation.window or {}
  opts.completion.documentation.window.border = "solid"

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
