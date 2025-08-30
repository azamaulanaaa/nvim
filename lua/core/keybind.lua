local bind = vim.keymap.set

-- lsp
bind("n", "<leader>ra", vim.lsp.buf.rename, { desc = "lsp rename" })
bind("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
bind("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })

-- diagnostic
bind("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = { border = "solid" } })
end, { desc = "go to previous diagnostic" })
bind("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = { border = "solid" } })
end, { desc = "go to next diagnostic" })

-- comment
bind("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
bind("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- fzf lua
bind("n", "<leader>fw", "<cmd>FzfLua live_grep_native<CR>", { desc = "fuzzy live grep" })
bind("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "fuzzy find files" })
bind("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "fuzzy find help tags" })
bind("n", "<leader>fb", "<cmd>FzfLua blines<cr>", { desc = "fuzzy find lines in current buffer" })

-- nvim tree
bind("n", "<C-o>", "<cmd>NvimTreeToggle<cr>", { desc = "toggle nvimtree file tree" })

-- buffer
bind("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "close current buffer" })

-- gitsigns
bind("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "reset git hunk" })
bind("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "reset git hunk" })
bind("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "stage git hunk" })
bind("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "stage git hunk" })
bind("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "go to previous git hunk" })
bind("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "go to next git hunk" })

-- git conflict
bind("n", "<leader>co", "<Plug>(git-conflict-ours)", { desc = "git conflict choose ours" })
bind("n", "<leader>ct", "<Plug>(git-conflict-theirs)", { desc = "git conflict choose theirs" })
bind("n", "[c", "<Plug>(git-conflict-prev-conflict)", { desc = "go to previous git conflict" })
bind("n", "]c", "<Plug>(git-conflict-prev-conflict)", { desc = "go to next git conflict" })
