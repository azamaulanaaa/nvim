return {
	'kyazdani42/nvim-tree.lua',
	requires = {
		{ 'kyazdani42/nvim-web-devicons' }
	},
	opt = true,
	keys = { '<c-o>' },
	setup = function()
		local config = {
			nvim_tree_side									= 'left',
			nvim_tree_width									= 30,
			nvim_tree_auto_close						= 1,
			nvim_tree_auto_resize						= 0,
			nvim_tree_follow								= 1,
			nvim_tree_window_picker_exclude = {
				filetype = {
					'packer',
				},
				buftype = {
					'terminal',
				},
			},
			nvim_tree_hide_dotfiles					= 1,
			nvim_tree_root_folder_modifier	= table.concat {':t:gs?$?/..', string.rep(' ', 1000), '?:gs?^??'},
			nvim_tree_add_trailing					= 0,
			nvim_tree_indent_markers				= 1,
			nvim_tree_git_hl								= 1,
			nvim_tree_show_icons						= {
				git = 1,
				folders = 1,
				files = 1
			},
			nvim_tree_icons									= { default = '' },
		}

		for name, value in pairs(config) do
			vim.g[name] = value
		end
	end,
	config = function()
		-- Keybinding
		vim.api.nvim_set_keymap('n', '<c-o>', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
	end,
}
