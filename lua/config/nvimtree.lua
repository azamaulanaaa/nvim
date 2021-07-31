return {
	'kyazdani42/nvim-tree.lua',
	requires = {
		{ 'kyazdani42/nvim-web-devicons' }
	},
	config = function()
		local g = vim.g

		-- Window
		g.nvim_tree_side = 'left'
		g.nvim_tree_width = 30
		g.nvim_tree_auto_close = 1
		g.nvim_tree_auto_resize = 0
		g.nvim_tree_follow = 1
		g.nvim_tree_window_picker_exclude = {
			filetype = {
				'packer',
			},
			buftype = {
				'terminal',
			},
		}

		-- File list
		g.nvim_tree_hide_dotfiles = 1

		-- Look
		g.nvim_tree_root_folder_modifier = table.concat {':t:gs?$?/..', string.rep(' ', 1000), '?:gs?^??'}
		g.nvim_tree_add_trailing = 0
		g.nvim_tree_indent_markers = 1
		g.nvim_tree_git_hl = 1
		g.nvim_tree_show_icons = {
				git = 1,
				folders = 1,
				files = 1
		}
		g.nvim_tree_icons = {
				default = '',
		}

		-- Keybinding
		vim.api.nvim_set_keymap('n', '<c-o>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
	end,
}
