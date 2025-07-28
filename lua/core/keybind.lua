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
bind("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
bind("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
bind("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
bind("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
bind("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
bind("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
bind("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
bind("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
bind("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
bind("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" })
