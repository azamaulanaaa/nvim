return {
	'nvim-treesitter/nvim-treesitter', 
	run = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup {
			hightlight = {
				enable = true,
				disable = {},
			},
			ensure_installed = {
				'bash',
				'javascript',
				'typescript',
				'tsx',
				'json',
				'yaml',
				'html',
				'go',
				'lua',
				'dockerfile',
				'python',
			},
		}
	end,
}
