local bind = vim.keymap.set

-- lsp
bind("n", "<leader>ra", vim.lsp.buf.rename, { desc = "lsp rename" })
