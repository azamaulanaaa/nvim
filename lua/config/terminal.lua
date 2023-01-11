return {
	'akinsho/toggleterm.nvim',
	config = function()
		require('toggleterm').setup{
            open_mapping = [[<c-\>]],
            shade_terminals = true,
            direction = 'float',
            highlights = {
                Statusline = {
                    link = 'Statusline',
                },
                StatuslineNC = {
                    link = 'StatuslineNC',
                },
            },
        }
	end,
}
