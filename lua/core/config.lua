local opt = vim.opt
local g = vim.g

-- file format
opt.fileformats = "unix"

-- indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- no wrap
opt.wrap = false

-- gap when scroll
opt.scrolloff = 4
opt.sidescrolloff = 12

-- clipboard
opt.clipboard = "unnamedplus"

-- keymap
g.mapleader = "\\"

-- disable netrw because we have nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- cursor line
opt.cursorline = true

-- diagnostic
vim.diagnostic.config({ virtual_text = true })
