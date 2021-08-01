return {
	'nvim-telescope/telescope.nvim',
	requires = {
		{ 'nvim-lua/popup.nvim' }, 
		{ 'nvim-lua/plenary.nvim' },
	},
	config = function()
		require('telescope').setup{
			defaults = {
				file_ignore_patterns = {
					'.git',
					'node_modules',
				},
			},
		}

		vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true } )
	end,
}
