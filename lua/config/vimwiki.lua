return {
	'vimwiki/vimwiki',
	config = function()
		vim.g.vimwiki_list = {
			{
				path = '~/journal',
				syntax = 'markdown',
				ext = '.md',
			},
		}

		-- Spell checking
		vim.cmd('autocmd filetype vimwiki setlocal spell spelllang=en_us')	
	end,
}
