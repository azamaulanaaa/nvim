return {
	'vimwiki/vimwiki',
	opt = true,
	ft = { 'markdown' },
	keys = { '<leader>ww' },
	setup = function()
		vim.g.vimwiki_list = {
			{
				path = '~/journal',
				syntax = 'markdown',
				ext = '.md',
			},
		}
	end,
	config = function()
		-- Spell checking
		vim.cmd('autocmd filetype vimwiki setlocal spell spelllang=en_us')	
	end,
}
