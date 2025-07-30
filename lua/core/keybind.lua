local bind = vim.keymap.set

-- lsp
bind("n", "<leader>ra", vim.lsp.buf.rename, { desc = "lsp rename" })
bind("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
bind("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })

-- comment
bind("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
bind("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope
bind("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
bind("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
bind("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

-- nvim tree
bind("n", "<C-o>", "<cmd>NvimTreeToggle<cr>", { desc = "toggle nvimtree file tree" })

-- buffer
bind("n", "<leader>bb", "<cmd>bprevious<cr>", { desc = "go to previous buffer" })
bind("n", "<leader>bn", "<cmd>bNext<cr>", { desc = "go to next buffer" })
