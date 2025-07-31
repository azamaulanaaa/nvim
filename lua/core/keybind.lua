local bind = vim.keymap.set

-- lsp
bind("n", "<leader>ra", vim.lsp.buf.rename, { desc = "lsp rename" })
bind("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
bind("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })

-- diagnostic
bind("n", "[d", function()
	vim.diagnostic.goto_prev({ float = { border = "single" } })
end, { desc = "go to previous diagnostic", remap = true })
bind("n", "]d", function()
	vim.diagnostic.goto_next({ float = { border = "single" } })
end, { desc = "go to next diagnostic", remap = true })

-- comment
bind("n", "<leader>/", "gcc", { desc = "toggle comment" })
bind("v", "<leader>/", "gc", { desc = "toggle comment" })

-- fzf lua
bind("n", "<leader>fw", "<cmd>FzfLua live_grep_native<CR>", { desc = "fuzzy live grep" })
bind("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "fuzzy find files" })
bind("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "fuzzy find files" })

-- nvim tree
bind("n", "<C-o>", "<cmd>NvimTreeToggle<cr>", { desc = "toggle nvimtree file tree" })

-- buffer
bind("n", "<leader>bb", "<cmd>bprevious<cr>", { desc = "go to previous buffer" })
bind("n", "<leader>bn", "<cmd>bNext<cr>", { desc = "go to next buffer" })

-- gitsigns
bind("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "reset git hunk" })
bind("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "reset git hunk" })
bind("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "stage git hunk" })
bind("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "stage git hunk" })
