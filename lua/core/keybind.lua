local bind = vim.keymap.set

-- lsp
bind("n", "<leader>ra", vim.lsp.buf.rename, { desc = "lsp rename" })
bind("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
bind("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })

-- comment
bind("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
bind("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- fzf lua
bind("n", "<leader>fw", "<cmd>FzfLua live_grep_native<CR>", { desc = "fuzzy live grep" })
bind("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "fuzzy find files" })
bind("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "fuzzy find files" })

-- nvim tree
bind("n", "<C-o>", "<cmd>NvimTreeToggle<cr>", { desc = "toggle nvimtree file tree" })

-- buffer
bind("n", "<leader>bb", "<cmd>bprevious<cr>", { desc = "go to previous buffer" })
bind("n", "<leader>bn", "<cmd>bNext<cr>", { desc = "go to next buffer" })
