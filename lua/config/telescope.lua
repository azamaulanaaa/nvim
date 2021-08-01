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

		vim.api.nvim_set_keymap('n', '<leader>f', require('telescope.builtin').find_files, { noremap = true, silent = true } )
	end,
}
