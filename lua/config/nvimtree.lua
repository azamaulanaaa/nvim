vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_ignore_ft = {}
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_auto_resize = 0
vim.g.nvim_tree_window_picker_exclude = {
	filetype = {
		'packer',
	},
	buftype = {
		'terminal',
	},
}

vim.api.nvim_set_keymap('n', '<c-o>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
vim.cmd([[
	highlight NvimTreeFolderIcon guibg=blue
]])
