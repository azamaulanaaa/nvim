return {
	'gelguy/wilder.nvim',
	config = function()
		vim.cmd([[
			call wilder#enable_cmdline_enter()
		]])

		-- Show sugestion
		vim.o.wildcharm = 9 -- 9 for <Tab>

		-- Keybindings
		vim.api.nvim_set_keymap('c', '<tab>', [[wilder#in_context() ? wilder#next() : '<tab>']], { expr = true })
		vim.api.nvim_set_keymap('c', '<s-tab>', [[wilder#in_context() ? wilder#previous() : '<s-tab>']], { expr = true })

		-- Trigger
		vim.cmd([[
			call wilder#set_option('modes', ['/', '?', ':'])
		]])
	end,
}
